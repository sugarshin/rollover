$ = require 'jquery'

class Rollover
  "use strict"

  _defaults:
    offStr: '_off'
    onStr: '_on'
    childOnly: true

  _prepareSrcs: ->
    @_srcOff = @$img.attr 'src'
    @_srcOn = @_srcOff.replace @opts.offStr, @opts.onStr

  _preload: -> $('<img />').attr 'src', @_srcOn

  constructor: (@el, opts) ->
    @opts = $.extend {}, @_defaults, opts
    @$el = $(@el)

    if @opts.childOnly
      @$img = @$el.children 'img'
    else
      @$img = $el.find 'img'

    @_prepareSrcs()
    @_preload()
    @addEvents()

  toOver: ->
    @$img.attr 'src', @_srcOn
    return this

  toNormal: ->
    @$img.attr 'src', @_srcOff
    return this

  addEvents: ->
    @$el.on 'mouseenter.rollover', => @toOver()
    @$el.on 'mouseleave.rollover', => @toNormal()
    return this

  rmEvents: ->
    @$el.off 'mouseenter.rollover'
    @$el.off 'mouseleave.rollover'
    return this

  destroy: -> @$el.remove()

if typeof define is 'function' and define.amd
  define -> Rollover
else if typeof module isnt 'undefined' and module.exports
  module.exports = Rollover
else
  global.Rollover or= Rollover
