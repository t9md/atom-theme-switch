module.exports = {
  activate() {
    this.commandsDisposable = atom.commands.add("atom-workspace", {
      "theme-switch:next": () => this.switchTheme("next", "profiles"),
      "theme-switch:prev": () => this.switchTheme("prev", "profiles"),
      "theme-switch:next-dark": () => this.switchTheme("next", "darkProfiles"),
      "theme-switch:prev-dark": () => this.switchTheme("prev", "darkProfiles"),
      "theme-switch:next-light": () => this.switchTheme("next", "lightProfiles"),
      "theme-switch:prev-light": () => this.switchTheme("prev", "lightProfiles"),
      "theme-switch:clip-current-theme": () => atom.clipboard.write(this.getCurrentTheme()),
    })
  },

  deactivate() {
    this.commandsDisposable.dispose()
  },

  getCurrentTheme() {
    return atom.config.get("core.themes").join(" ")
  },

  switchTheme(direction, profileName) {
    const profiles = atom.config.get(`theme-switch.${profileName}`).map(profile => profile.replace(/ +/g, " ")) // normalize spaces.
    let index = profiles.indexOf(this.getCurrentTheme())

    // determine next/prev index
    if (index >= 0) {
      if (direction === "next") {
        index++
        if (index >= profiles.length) index = 0
      } else {
        index--
        if (index < 0) index = profiles.length - 1
      }
    } else {
      index = 0
    }

    atom.config.set("core.themes", profiles[index].split(" "))
    if (atom.config.get("theme-switch.logToConsole")) {
      console.info("theme-switch:", this.getCurrentTheme())
    }
  },
}
