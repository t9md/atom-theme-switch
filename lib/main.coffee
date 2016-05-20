{CompositeDisposable} = require 'atom'

Config =
  profiles:
    order: 1
    description: 'list of "ui and syntax pair" used for `theme-switch:next`, `theme-switch:prev`'
    type: 'array'
    items:
      type: 'string'
    default: [
      "atom-dark-ui atom-dark-syntax"
      "one-dark-ui one-dark-syntax"
      "atom-light-ui atom-light-syntax"
      "one-light-ui one-light-syntax"
    ]
  darkProfiles:
    order: 2
    description: 'used for `theme-switch:next-dark`, `theme-switch:prev-dark`'
    type: 'array'
    items:
      type: 'string'
    default: [
      "atom-dark-ui atom-dark-syntax"
      "one-dark-ui one-dark-syntax"
    ]
  lightProfiles:
    order: 3
    description: 'used for `theme-switch:next-light`, `theme-switch:prev-light`'
    type: 'array'
    items:
      type: 'string'
    default: [
      "atom-light-ui atom-light-syntax"
      "one-light-ui one-light-syntax"
    ]

module.exports =
  subscriptions: null
  config: Config

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'theme-switch:next': => @switch('next', 'profiles')
      'theme-switch:prev': => @switch('prev', 'profiles')
      'theme-switch:next-dark': => @switch('next', 'darkProfiles')
      'theme-switch:prev-dark': => @switch('prev', 'darkProfiles')
      'theme-switch:next-light': => @switch('next', 'lightProfiles')
      'theme-switch:prev-light': => @switch('prev', 'lightProfiles')

  deactivate: ->
    @subscriptions.dispose()
    @subscriptions = null

  equalProfile: (a, b) ->
    (a.length is b.length is 2) and (a[0] is b[0]) and (a[1] is b[1])

  switch: (direction, profileName) ->
    config = atom.config.get("theme-switch.#{profileName}")
    profiles = config.map((profile) -> profile.split(/\s+/))
    current = atom.config.get("core.themes")

    # detect current
    index = null
    for profile, i in profiles when @equalProfile(profile, current)
      index = i
      break

    # determine next/prev index
    if index?
      index += (if direction is 'next' then +1 else -1)
      index = index % profiles.length
      index = profiles.length + index if index < 0
    else
      index = 0

    # update theme
    atom.config.set("core.themes", profiles[index])
