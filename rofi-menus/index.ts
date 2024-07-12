import { argv } from "bun"

export type MenuItem = {
  name: string,
  action?: () => Promise<void> | void,
}
export type Context = {
  inRofi: boolean,
  giveList: boolean,
  item: string,
}

export function getContext(menu: MenuItem[]): Context {
  let giveList = true
  let item = ""

  for (const menuitem of menu) {
    if (argv.includes(menuitem.name)) {
      item = menuitem.name
      giveList = false
    }

  }
  return {
    inRofi: !argv.includes("--script"),
    giveList,
    item,
  }
}

export async function getMenu(menu: MenuItem[]): Promise<string> {
  const ctx = getContext(menu)

  if (ctx.giveList) {
    console.log(menu.map(item => item.name).join("\n"))
  } else {
    for (const item of menu) {
      if (item.name === ctx.item) {
        if (item.action) {
          await item.action()
        }
        return item.name
      }
    }
  }
  return ""
}




export async function runSilent(parts: string[]) {
  const process = Bun.spawn(parts, {
    stdio: ["ignore", "ignore", "ignore"]
  })
  await process.exited
}
