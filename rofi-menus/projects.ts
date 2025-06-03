#!/usr/bin/env bun

import { spawnMenu, type MenuItem } from ".";
import fs from "fs";
import path from "path";
import os from "os";

const homedir = os.homedir();
const dirs = fs.readdirSync(path.join(homedir, "source"));

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

menus.push({
  name: `  nixos`,
  action: async () => {
    const process = Bun.spawn(["alacritty", "--command", "tmux", "attach-session", "-t", "nixos", "&"], {
      stdio: ["ignore", "ignore", "ignore"],
    });

    await process.exited;

  }
})


await spawnMenu(menus);
