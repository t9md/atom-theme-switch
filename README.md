# theme-switch

Switch theme(ui and syntax) quickly.

# Configuration

Configure profile set directly in your `config.cson` or via setting UI.
Each profile is space sepalated pair of ui-theme and syntax-theme.

## example

```coffeescript
"*":
  "theme-switch":
    profiles: [
      "atom-dark-ui spacegray-dark-syntax"
      "atom-dark-ui atom-dark-syntax"
      "atom-light-ui atom-light-syntax"
    ]
```

## How to use

From command palette, incoke `theme-switch:next` or `theme-switch:prev`.
