require 'dxruby'

require_relative 'bar'
require_relative 'ball'
require_relative 'block'

font = Font.new(24)
bar = Bar.new(320, 400, nil)
ball = Ball.new(320, 400, nil)
blocks = []

for i in 0..7
  for j in 2..6
      blocks  << Block.new(i * Block::BLOCK_SIZE_X, j * Block::BLOCK_SIZE_Y, nil)
  end
end

$score = 0

Window.loop do
  bar.update
  ball.update

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

  #ball.side_hit(bar.x, bar.y)
  Sprite.check(bar, ball)
  Sprite.check(ball, blocks)
end