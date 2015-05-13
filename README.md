# theme-switch

Switch theme(ui and syntax) quickly.

![gif](https://raw.githubusercontent.com/t9md/t9md/2391f495870160c16ee560e0ee5dc913f0df74d4/img/atom-theme-switch.gif)

# Features

* You can switch forward/backward within defined theme set with `next` and `prev`
* Easy to configure from settin UI.
* Support as many theme set as you like.
* Respect current theme set(means `next`, `prev` start from current theme set index).
* You can use three theme sets(All, Dark, Light) from which you switch to `next` / `prev` theme.

# Configuration

Configure profile set directly in your `config.cson` or via setting UI.  
Each profile is space sepalated pair of ui-theme and syntax-theme.

e.g.

```coffeescript
"*":
  "theme-switch":
    profiles: [
      "atom-dark-ui spacegray-dark-syntax"
      "atom-dark-ui atom-dark-syntax"
      "atom-light-ui atom-light-syntax"
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
