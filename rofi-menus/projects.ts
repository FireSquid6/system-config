#!/usr/bin/env bun

import { spawnMenu, type MenuItem } from ".";
import fs from "fs";
import path from "path";

const dirs = fs.readdirSync("/home/firesquid/source");

fs.writeFileSync("/home/firesquid/rofi.txt", dirs.join("\n"));

const menus: MenuItem[] = [];

for (const dir of dirs) {
  menus.push({
    name: `  ${dir}`,
    action: async () => {
      const filepath = path.join(Bun.env.SCRIPTS_DIR!, "proj.sh");
      const process = Bun.spawn([filepath, dir], {
        stdio: ["ignore", "ignore", "ignore"],
      });

      await process.exited;
    }
  })
}

await spawnMenu(menus)
