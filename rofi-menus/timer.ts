#!/usr/bin/env bun

import { spawnMenu, type MenuItem } from "."

const menus: MenuItem[] = []


for (let i = 5; i <= 120; i += 5) {
  menus.push({
    name: `${i} minutes`,
    action: async () => {
      const process = Bun.spawn(["/etc/nixos/scripts/timer/start.ts", `00:${i}`], {
        stdio: ["ignore", "ignore", "ignore"]
      })
      await process.exited
    }
  })
}


spawnMenu(menus)
