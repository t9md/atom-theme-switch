# theme-switch

Switch theme(ui and syntax pair).

![gif](https://raw.githubusercontent.com/t9md/t9md/2391f495870160c16ee560e0ee5dc913f0df74d4/img/atom-theme-switch.gif)

# Features

* Switch to next or previous theme from defined set of ui and syntax pair.
* There are three theme set available(All, Dark, Light), use it whichever you like.

# Commands

- `theme-switch-next`: Set next theme in `profiles`
- `theme-switch-prev`: Set previous theme in `profiles`
- `theme-switch-next-dark`: Set next theme in `darkProfiles`
- `theme-switch-prev-dark`: Set previous theme in `darkProfiles`
- `theme-switch-next-light`: Set next theme in `lightProfiles`
- `theme-switch-prev-light`: Set previous theme in `lightProfiles`
- `theme-switch:clip-current-theme`: Save current active theme to clipboard.

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
In case you are not sure for exact name of ui and syntax theme, use `theme-switch:clip-current-theme` command.
Technically "ui and syntax theme pair" can be buit by `atom.config.get('core.themes').join(" ")`.

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
