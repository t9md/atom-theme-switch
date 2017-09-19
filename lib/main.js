module.exports = {
  activate(state) {
    this.commandsDisposable = atom.commands.add("atom-workspace", {
      "theme-switch:next": () => this.switch("next", "profiles"),
      "theme-switch:prev": () => this.switch("prev", "profiles"),
      "theme-switch:next-dark": () => this.switch("next", "darkProfiles"),
      "theme-switch:prev-dark": () => this.switch("prev", "darkProfiles"),
      "theme-switch:next-light": () => this.switch("next", "lightProfiles"),
      "theme-switch:prev-light": () => this.switch("prev", "lightProfiles"),
      "theme-switch:clip-current-theme": () => this.copyCurrentThemeToClipboard(),
    })
  },

  deactivate() {
    this.commandsDisposable.dispose()
  },

  copyCurrentThemeToClipboard() {
    atom.clipboard.write(this.getCurrentTheme())
  },

  getCurrentTheme() {
    return atom.config.get("core.themes").join(" ")
  },

  switch(direction, profileName) {
    const profiles = atom.config.get(`theme-switch.${profileName}`).map(profile => profile.replace(/ +/g, " ")) // normalize spces.
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
