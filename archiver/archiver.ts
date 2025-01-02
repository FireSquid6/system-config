import { type AsyncResult, asome, anone } from "./option";
import fs from "fs";
import { $ } from "bun";

export type ArchiverApi = {
  username: string;
  token?: string;
  ntfyTopic: string;
}


export type Repo = {
  cloneUrl: string;
  name: string;
}


export async function getAllRepos(username: string, token: string): AsyncResult<Repo[]> {
  const repos: Repo[] = [];

  let page = 1;

  while (true) {
    const response = await fetch(`https://api.github.com/users/${username}/repos?page=${page}`, {
      method: "GET",
      headers: {
        "Authorization": `Bearer ${token}`,
      }
    });

    if (!response.ok) {
      return anone(`Failed to get repos: ${response.statusText}`);
    }

    const repositories = await response.json();

    if (repositories.length === 0 || repositories === undefined) {
      break;
    }

    for (let i = 0; i < repositories.length; i++) {
      const repository = repositories[i];
      if (repository.fork) {
        continue;
      }
      console.log("Found:", repository.name);
      repos.push({
        cloneUrl: repository.clone_url,
        name: repository.name,
      });
    }

    page += 1;
  }

  return asome(repos);
}

export async function cloneAndArchive(repos: Repo[]): AsyncResult<string> {
  try {
    fs.mkdirSync("./temp", { recursive: true });
    const datestring = new Date().toISOString().replace(/:/g, "-").replace(/\./g, "-")

    for (const repo of repos) {
      console.log("Cloning:", repo.name);
      await $`git clone ${repo.cloneUrl} ./temp/${repo.name}`;
    }

    console.log("Zipping files...");
    const zipFilename = `${datestring}.zip`
    await $`zip -r ./${zipFilename} ./temp`;

    fs.rmdirSync("./temp", { recursive: true });

    return asome(zipFilename);
  } catch (e) {
    return anone(`${e}`);
  }
}
