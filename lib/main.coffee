{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null
  config:
    profiles:
      description: 'collection of ui and syntax pair used for `theme-switch:next`, `theme-switch:prev`'
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
      description: '`theme-switch:next-dark`, `theme-switch:prev-dark`'
      type: 'array'
      items:
        type: 'string'
      default: [
        "atom-dark-ui atom-dark-syntax"
        "one-dark-ui one-dark-syntax"
      ]
    lightProfiles:
      description: '`theme-switch:next-light`, `theme-switch:prev-light`'
      type: 'array'
      items:
        type: 'string'
      default: [
        "atom-light-ui atom-light-syntax"
        "one-light-ui one-light-syntax"
      ]

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'theme-switch:next':       => @switch('next')
      'theme-switch:prev':       => @switch('prev')
      'theme-switch:next-dark':  => @switch('next', 'dark')
      'theme-switch:prev-dark':  => @switch('prev', 'dark')
      'theme-switch:next-light': => @switch('next', 'light')
      'theme-switch:prev-light': => @switch('prev', 'light')

  deactivate: ->
    @subscriptions.dispose()

  getProfiles: (luminous)->
    profiles =
      if luminous in ['dark', 'light']
        "#{luminous}Profiles"
      else
        'profiles'
    atom.config.get("theme-switch.#{profiles}")

  profileFor: (direction, luminous) ->
    profiles = (prof.split(/\s+/) for prof in @getProfiles(luminous))
    current  = atom.config.get "core.themes"

    index = i for profile, i in profiles when "#{profile}" is "#{current}"
    return profiles[0] unless index?

    index =
      if direction is 'next'
        (index + 1) % profiles.length
      else
        if index == 0 then profiles.length - 1 else index - 1

    profiles[index]

  switch: (direction, luminous) ->
    atom.config.set "core.themes", @profileFor(direction, luminous)
