#!/usr/bin/env bun
import fs from "fs"
import { $ } from "bun"

const args = process.argv
for (let i = 0; i < args.length; i++) {
  if (args[i].includes('.ts')) {
    args.splice(0, i + 1)
    break
  }
}

if (args.length !== 1) {
  console.log("Usage: github-backup <configFile>")
  process.exit(1)
}

type ConfigFile = {
  username: string
  token?: string
  ntfyTopic: string
}

const config: ConfigFile = JSON.parse(fs.readFileSync(args[0], "utf-8"))

type Repo = {
  cloneUrl: string
  name: string
}

async function errorOut(error: string) {
  // post to ntfy.sh
  console.error(error)
  await fetch(`https://ntfy.sh/${config.ntfyTopic}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: error
  }) 

  process.exit(1)
}

// TODO - get private repos
// TODO - get repos from organizations
async function getAllRepos(username: string): Promise<Repo[]> {
  console.log("Finding repos to clone...")
  const repos: Repo[] = []

  let page = 1

  while (true) {
    const response = await fetch(`https://api.github.com/users/${username}/repos?page=${page}`, {
      method: "GET",
      headers: {
        "Authorization": `Bearer ${config.token}`,
      }
    })
    if (!response.ok) {
      await errorOut(`Failed to get repos: ${response.statusText}`)
    }
    const repositories = await response.json()

    if (repositories.length === 0 || repositories === undefined) {
      break
    }

    for (let i=0; i < repositories.length; i++) {
      const repository = repositories[i]
      console.log("Found:", repository.name)
      if (repository.fork) {
        console.log("repository is a fork, skipping")
        continue;
      }
      repos.push({
        cloneUrl: repository.clone_url,
        name: repository.name
      })
    }

    page += 1
  }

  return repos 
}

async function cloneAndArchive(repos: Repo[]) {
  // const repos = await getAllRepos("firesquid6")
  const datestring = new Date().toISOString().replace(/:/g, "-").replace(/\./g, "-")

  fs.mkdirSync(`./${datestring}`)

  for (const repo of repos) {
    console.log("Cloning:", repo.name)
    await $`git clone ${repo.cloneUrl} ./${datestring}/${repo.name}`
  }

  console.log("Cloning complete")
  console.log("Zipping files...")
  await $`zip -r ./${datestring}.zip ./${datestring}`
  fs.rmdirSync(`./${datestring}`, { recursive: true })

  const stats = fs.statSync(`./${datestring}.zip`)
  return stats.size
}

const repos = await getAllRepos(config.username)
let size = 0
try {
  size = await cloneAndArchive(repos)
} catch (e) {
  await errorOut(`Failed to clone and archive: ${e}`)
}



await fetch(`https://ntfy.sh/${config.ntfyTopic}`, {
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  },
  body: `Successfully cloned and archived ${repos.length} repositories containing ${Math.round(size / 1000000)} MB .`
}) 

