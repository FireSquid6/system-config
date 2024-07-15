#!/usr/bin/env bun

import { spawnMenu, type MenuItem } from "."
import fs from "fs"

const dirs = fs.readdirSync("/home/firesquid/source")

fs.writeFileSync("/home/firesquid/rofi.txt", dirs.join("\n"))

const menus: MenuItem[] = []
menus.push({
  name: `  New Project`,
  action: async () => {
    const process = Bun.spawn(["/etc/nixos/scripts/proj.sh", "new"], {
      stdio: ["ignore", "ignore", "ignore"]
    })
    await process.exited
  }
})

for (const dir of dirs) {
  menus.push({
    name: `  ${dir}`,
    action: async () => {
      const process = Bun.spawn(["/etc/nixos/scripts/proj.sh", dir], {
        stdio: ["ignore", "ignore", "ignore"]
      })
      await process.exited
    }
  })
}

await spawnMenu(menus)
