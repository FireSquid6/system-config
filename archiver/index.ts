import { cloneAndArchive, getAllRepos } from "./archiver";

async function ntfy(message: string, topic?: string) {
  console.log(message);
  if (topic === undefined) {
    return;
  }

  await fetch(`https://nfty.sh/${topic}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: message,
  });
}


async function main() {
  const topic = process.env.NTFY_TOPIC;
  const username = process.env.GITHUB_USERNAME;
  const token = process.env.GITHUB_TOKEN;

  if (username === undefined) {
    ntfy("Fatal: username not defined in env", topic);
    process.exit(1);
  }

  if (token === undefined) {
    ntfy("Fatal: token not defined in env", topic);
    process.exit(1);
  }

  console.log(`Finding repos for ${username}`);

  const [reposRes, repos] = await getAllRepos(username, token);

  if (reposRes === "none") {
    ntfy(`Fatal: error fetching repos: ${repos}`, topic);
    process.exit(1);
  }

  const [archiveRes, filename] = await cloneAndArchive(repos);

  if (archiveRes === "none") {
    ntfy(`Fatal: error cloning repos: ${filename}`, topic);
    process.exit(1);
  }

  ntfy(`Success! Cloned repo to: ${filename}`, topic);
}


main();
