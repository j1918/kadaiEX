require 'dxruby'

require_relative 'bar'
require_relative 'ball'
require_relative 'block'

font = Font.new(24)
bar = Bar.new(270, 400, nil)
ball = Ball.new(rand(270..270 + Bar::BAR_SIZE_X), 400 - Ball::REDIUS, nil)
blocks = []

for i in 0..7
  for j in 2..6
      blocks  << Block.new(i * Block::BLOCK_SIZE_X, j * Block::BLOCK_SIZE_Y, nil)
  end
end

$score = 0
gameover_flag = false
before_speed = 3
count = 0

Window.loop do
  font = Font.new(64)
  Window.draw_font(170, 200, "ブロック崩し", font)
  font = Font.new(32)
  Window.draw_font(190, 270, "PRESS ENTER!!", font)
  if(Input.keyDown?(K_RETURN) == true)
    break
  end
end

Window.loop do
  if(!gameover_flag && $score < 400)
    font = Font.new(24)
    bar.update
    ball.update
    ball.change_speed

    Window.draw_circle_fill(ball.x, ball.y, Ball::REDIUS, C_WHITE)
    Window.draw_box_fill(bar.x, bar.y, bar.x + Bar::BAR_SIZE_X, bar.y + Bar::BAR_SIZE_Y, C_MAGENTA)
    blocks.each_with_index do |block, i|
      if(!block.vanished?)
        case i % 4
        when 0 
            Window.draw_box_fill(block.x, block.y, block.x + Block::BLOCK_SIZE_X, block.y + Block::BLOCK_SIZE_Y, C_RED)
        when 1
            Window.draw_box_fill(block.x, block.y, block.x + Block::BLOCK_SIZE_X, block.y + Block::BLOCK_SIZE_Y, C_BLUE)
        when 2
            Window.draw_box_fill(block.x, block.y, block.x + Block::BLOCK_SIZE_X, block.y + Block::BLOCK_SIZE_Y, C_YELLOW)
        when 3
            Window.draw_box_fill(block.x, block.y, block.x + Block::BLOCK_SIZE_X, block.y + Block::BLOCK_SIZE_Y, C_GREEN)
        end
      end
    end

    Window.draw_font(10, 0, "SCORE: #{$score}", font)

    ball.hit(bar.x, bar.y)
    Sprite.check(ball, blocks)
    gameover_flag = ball.gameover?

    if(before_speed != ball.speed)
      count += 1
    end

    if(count >= 1)
      Window.draw_font(200, 0, "SPEED UP!!", font)
      count += 1
    end

    if(count >= 60)
      count = 0
    end
    before_speed = ball.speed
  elsif($score >= 400)
    font = Font.new(64)
    Window.draw_font(150, 200, "Game Clear!!", font)
    font = Font.new(32)
    Window.draw_font(250, 270, "score : #{$score}", font)
  else
    font = Font.new(64)
    Window.draw_font(170, 200, "Game Over", font)
    font = Font.new(32)
    Window.draw_font(250, 270, "score : #{$score}", font)
  end
end