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

let doSeconds = false
let type = "timeleft"

for (const arg of args) {
  switch (arg) {
    case "--endtime":
      type = "endtime"
      break
    case "--timeleft":
      type = "timeleft"
      break
    case "--unix":
      type = "unix"
      break
    case "--seconds":
      doSeconds = true
      break
  }

}

const timeString = fs.readFileSync(path.join(os.homedir(), ".timer"), "utf-8")
const endTime = new Date(parseInt(timeString))

switch (type) {
  case "unix":
    console.log(endTime.getTime() / 1000)
    break
  case "endtime":
    console.log(endTime.toString())
    break
  case "timeleft":
    const time = Math.floor((endTime.getTime() - Date.now()) / 1000)
    
    if (time <= 0) {
      console.log("00:00")
      break
    }

    const hours = Math.floor(time / 3600)
    const minutes = Math.floor((time % 3600) / 60)
    const seconds = time % 60
    
    if (doSeconds) {
      console.log(`${numToMyString(hours)}:${numToMyString(minutes)}:${numToMyString(seconds)}`)
      break
    }
    console.log(`${numToMyString(hours)}:${numToMyString(minutes)}`)
    break

}



function numToMyString(n: number): string {
  if (n < 10) {
    return `0${n}`
  }

  return n.toString()

}
