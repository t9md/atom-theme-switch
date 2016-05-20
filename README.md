# theme-switch

Switch theme(ui and syntax).

![gif](https://raw.githubusercontent.com/t9md/t9md/2391f495870160c16ee560e0ee5dc913f0df74d4/img/atom-theme-switch.gif)

# Features

* Switch to next/previous theme within defined theme set with `next` and `prev`
* You can use three theme sets(All, Dark, Light) from which you switch to `next` / `prev` theme.

# Configuration

Configure theme set(= profile) directly in your `config.cson` or via setting UI.  
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

# How to use

From command palette, invoke
* `Theme Swtich: Next`
* `Theme Swtich: Prev`

You can use light or dark only version of command by setting `darkProfiles` and `lightProfiles`.

* `Theme Swtich: Next Dark`
* `Theme Swtich: Prev Dark`
* `Theme Swtich: Next Light`
* `Theme Swtich: Prev Light`
