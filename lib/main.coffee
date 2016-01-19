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
      'theme-switch:next': => @switch('next')
      'theme-switch:prev': => @switch('prev')
      'theme-switch:next-dark':=> @switch('next', 'dark')
      'theme-switch:prev-dark':=> @switch('prev', 'dark')
      'theme-switch:next-light': => @switch('next', 'light')
      'theme-switch:prev-light': => @switch('prev', 'light')

  deactivate: ->
    @subscriptions.dispose()

  getProfiles: (luminous="profiles")->
    luminous += "Profiles" if luminous in ['dark', 'light']
    atom.config.get("theme-switch.#{luminous}").map (profile) ->
      profile.split(/\s+/)

  getThemes: (direction, luminous) ->
    profiles = @getProfiles(luminous)
    current = atom.config.get "core.themes"

    index = 0
    for profile, i in profiles when "#{profile}" is "#{current}"
      index = i + (if direction is 'next' then +1 else -1)

    index = index % profiles.length
    index = profiles.length + index if index < 0
    profiles[index]

  switch: (direction, luminous) ->
    atom.config.set "core.themes", @getThemes(direction, luminous)
