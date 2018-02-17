# theme-switch

Switch theme(ui and syntax pair).

![gif](https://raw.githubusercontent.com/t9md/t9md/2391f495870160c16ee560e0ee5dc913f0df74d4/img/atom-theme-switch.gif)

# Commands

- `theme-switch:next`: Set next theme in `profiles`
- `theme-switch:prev`: Set previous theme in `profiles`
- `theme-switch:next-dark`: Set next theme in `darkProfiles`
- `theme-switch:prev-dark`: Set previous theme in `darkProfiles`
- `theme-switch:next-light`: Set next theme in `lightProfiles`
- `theme-switch:prev-light`: Set previous theme in `lightProfiles`
- `theme-switch:add-to-profiles`: Add currently active theme to `profiles`
- `theme-switch:add-to-dark-profiles`: Add currently active theme to `darkProfiles`
- `theme-switch:add-to-light-profiles`: Add currently active theme to `lightProfiles`
- `theme-switch:clip-current-theme`: Save current active theme to clipboard

# Keymap

No keymap by default.  
Keymap example is here.
```coffeescript
'atom-workspace:not([mini])':
  'cmd-shift-up': 'theme-switch:prev'
  'cmd-shift-down': 'theme-switch:next'
```

# Configuration

Set "ui and syntax theme pair" as member of each theme-set.
You can add currently active "ui and syntax theme" to each profile by `add-to-profiles`, `add-to-dark-profiles` and `add-to-light-profiles`.
Technically "ui and syntax theme pair" can be built by `atom.config.get('core.themes').join(" ")`.

e.g.

```coffeescript
"theme-switch":
  profiles: [
    "atom-dark-ui spacegray-dark-syntax"
    "atom-dark-ui atom-dark-syntax"
    "atom-light-ui atom-light-syntax"
  ],
  darkProfiles: [
    "atom-dark-ui atom-dark-syntax"
    "one-dark-ui one-dark-syntax"
  ],
  lightProfiles: [
    "atom-light-ui atom-light-syntax"
    "one-light-ui one-light-syntax"
  ]
```
