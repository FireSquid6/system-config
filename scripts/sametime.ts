#!/usr/bin/env bun

const args = process.argv


// locate where "sametime.ts" is in the arguments
for (let i = 0; i < args.length; i++) {
  if (args[i].includes('sametime.ts')) {
    args.splice(0, i + 1)
    break
  }
}

const promises: Promise<void>[] = []

for (const command of args) {
  promises.push(new Promise<void>((resolve) => {
    Bun.spawn(command.split(' '), {
      stdin: "inherit",
      stdout: "inherit",
      onExit: () => {
        resolve()
      }
    })
  }))
}

await Promise.all(promises)

