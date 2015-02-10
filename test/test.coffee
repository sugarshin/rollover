assert = require 'power-assert'

$ = require 'jquery'
Rollover = require '../rollover'

mocha.setup 'bdd'
window.onload = ->
  if window.mochaPhantomJS
    mochaPhantomJS.run()
  else
    mocha.run()

# constructor
describe 'constructor', ->
  it 'インスタンスが作成されること', ->
    a = '<a href="#" class="test0">
          <img src="test_off.png">
        </a>'
    $('body').append a
    ro = new Rollover $('.test0')[0]
    assert ro instanceof Rollover

# .toOver()
describe '.toOver()', ->
  it '画像パスが_onのものに置換されること', ->
    a = '<a href="#" class="test1">
          <img src="test_off.png">
        </a>'
    $('body').append a
    ro = new Rollover $('.test1')[0]
    old = $('.test1 img').attr 'src'
    ro.toOver()
    assert old isnt $('.test1 img').attr 'src'

# .toNormal()
describe '.toNormal()', ->
  it '画像パスが_offのものに置換されること', ->
    a = '<a href="#" class="test2">
          <img src="test_off.png">
        </a>'
    $('body').append a
    ro = new Rollover $('.test2')[0]
    ro.toOver()
    over = $('.test2 img').attr 'src'
    ro.toNormal()
    assert over isnt $('.test2 img').attr 'src'
