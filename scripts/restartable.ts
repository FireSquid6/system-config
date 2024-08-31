#!/usr/bin/env bun

import type { Subprocess } from "bun"

let subprocess: Subprocess | null = null

function restartSubprocess() {
  if (subprocess) {
    subprocess.kill()
  }

  subprocess = Bun.spawn(args, {
    stdin: "ignore",
    stdout: "inherit",
  })
}

const args = process.argv

for (let i = 0; i < args.length; i++) {
  if (args[i].includes(".ts")) {
    args.splice(0, i + 1)
    break
  }
}

restartSubprocess()


for await (const _ of console) {
  console.log("=================")
  console.log("Rerunning Process")
  console.log("=================")
  restartSubprocess()
}
