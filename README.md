# theme-switch

Switch theme(ui and syntax).

![gif](https://raw.githubusercontent.com/t9md/t9md/2391f495870160c16ee560e0ee5dc913f0df74d4/img/atom-theme-switch.gif)

# Features

* Switch to next or previous theme within defined set of ui and syntax pair.
* Provide three kind of theme set store(All, Dark, Light).

# Commands

Use following command to change theme.

* `theme-switch-next`: Change to next theme in `profiles`
* `theme-switch-prev`: Change to previous theme in `profiles`
* `theme-switch-next-dark`: Change to next theme in `darkProfiles`
* `theme-switch-prev-dark`: Change to previous theme in `darkProfiles`
* `theme-switch-next-light`: Change to next theme in `lightProfiles`
* `theme-switch-prev-light`: Change to previous theme in `lightProfiles`

No keymap by default.  
Keymap example is here.
```coffeescript
'atom-workspace:not([mini])':
  'cmd-shift-up': 'theme-switch:prev'
  'cmd-shift-down': 'theme-switch:next'
```

# Configuration

Configure theme set(=profile) directly in your `config.cson` or via setting UI.  
If you are not sure for exact name of ui and syntax name.
Check `atom.config.get('core.theme')` in Chrome DevTools.

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
