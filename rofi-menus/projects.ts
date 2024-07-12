#!/usr/bin/env bun

import { getMenu, type MenuItem } from "."
import fs from "fs"

const dirs = fs.readdirSync("/home/firesquid/source")

fs.writeFileSync("/home/firesquid/rofi.txt", dirs.join("\n"))

const menus: MenuItem[] = dirs.map(dir => ({
  name: dir,
  action: async () => {
    const process = Bun.spawn(["proj.sh", dir], {
      stdio: ["ignore", "ignore", "ignore"]
    })
    await process.exited
  },
}))

await getMenu(menus)
