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
  console.log("Usage: github-backup <username>")
  process.exit(1)
}

const username = args[0]

type Repo = {
  cloneUrl: string
  name: string
}

// TODO - get private repos
// TODO - get repos from organizations
async function getAllRepos(username: string): Promise<Repo[]> {
  console.log("Finding repos to clone...")
  const repos: Repo[] = []

  let page = 1

  while (true) {
    const response = await fetch(`https://api.github.com/users/${username}/repos?page=${page}`)
    const repositories = await response.json()

    if (repositories.length === 0 || repositories === undefined) {
      break
    }

    for (let i=0; i < repositories.length; i++) {
      const repository = repositories[i]
      console.log("Found:", repository.name)
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
}

const repos = await getAllRepos(username)
await cloneAndArchive(repos)

