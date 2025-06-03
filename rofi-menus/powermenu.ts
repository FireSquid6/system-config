#!/usr/bin/env bun
import { spawnMenu, runSilent, type MenuItem } from "."

const options: Map<string, string> = new Map([
  ["󰒲  Suspend", "systemctl suspend"],
  ["⏻  Shutdown", "shutdown -h now"],
  ["󰍃  Logout", "hyprctl dispatch exit"],
  ["󰌙  Disconnect", "$SCRIPTS_DIR/disconnect.sh"],
  ["󰌘  Connect", "$SCRIPTS_DIR/connect.sh"],
])

const menus: MenuItem[] = []

for (const [name, command] of options) {
  menus.push({
    name: name,
    action: async () => {
      await runSilent(command.split(" "))
    }
  })
}

await spawnMenu(menus)
