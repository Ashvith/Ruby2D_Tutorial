# frozen_string_literal: true

require 'ruby2d'

set title: 'Reaction game'
set background: 'green'

message = Text.new('Click to begin')
game_started = false
square = nil
start_time = nil
duration = nil

on :mouse_down do |event|
  if game_started
    if square.contains?(event.x, event.y)
      duration = ((Time.now - start_time) * 1000).round
      square.remove
      message = Text.new("Well done! You took: #{duration} milliseconds. Click to begin", x: 20, y: 20)
      game_started = false
    end
  else
    message.remove
    square = Square.new(
      x: rand(get(:width) - 25), y: rand(get(:height) - 25),
      size: 25,
      color: 'purple'
    )
    start_time = Time.now
    game_started = true
  end
end

show
