#!/usr/bin/env bun
import fs from "fs"
import os from "os"
import path from "path"

const args = process.argv

for (let i = 0; i < args.length; i++) {
  if (args[i].includes(".ts")) {
    args.splice(0, i + 1)
  }
}


if (args.length === 0) {
  console.log("Usage: timer <time>")
  process.exit(1)
}


// time should be in hours:minutes format
const time = args[0].split(":")

if (time.length !== 2) {
  console.log("Invalid time format")
  process.exit(1)
}

const hours = parseInt(time[0])
const minutes = parseInt(time[1])

if (isNaN(hours) || isNaN(minutes)) {
  console.log("Invalid time format")
  process.exit(1)
}

const unixTime = (hours * 60 + minutes) * 60
const endTime = Date.now() + unixTime * 1000

const timerFile = path.join(os.homedir(), ".timer")

fs.writeFileSync(timerFile, endTime.toString())
