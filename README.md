# theme-switch

Switch theme(ui and syntax) quickly from command palette.

# Configuration

Configure profile set in your `config.cson`.  
Profile set is Array of Array("ui-theme" and "syntax-theme" pair).  
## example

```coffeescript
"*":
  "theme-switch":
    profiles: [
      [
        "atom-dark-ui"
        "spacegray-dark-syntax"
      ]
      [
        "atom-dark-ui"
        "atom-dark-syntax"
      ]
      [
        "atom-light-ui"
        "atom-light-syntax"
      ]
    ]
```
