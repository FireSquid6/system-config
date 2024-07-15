#!/usr/bin/env bun
import { getMenu, runSilent, type MenuItem } from "."

const options: Map<string, string> = new Map([
  ["  Lock", "/etc/nixos/scripts/lock.sh"],
  ["󰒲  Suspend", "systemctl suspend"],
  ["⏻  Shutdown", "shutdown -h now"],
  ["󰍃  Logout", "hyprctl dispatch exit"],
  ["󰌙  Disconnect", "/etc/nixos/scripts/disconnect.sh"],
  ["󰌘  Connect", "/etc/nixos/scripts/connect.sh"],
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

await getMenu(menus)
