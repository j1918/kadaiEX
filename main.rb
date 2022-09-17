require 'dxruby'

require_relative 'bar'
require_relative 'ball'
require_relative 'block'

BLOCK_SIZE_X = 80
BLOCK_SIZE_X = 20

font = Font.new(32)
bar = Bar.new(320, 400, player_img)
blocks = []

for i in 0...7
    blocks  << Block.new(i * BLOCK_SIZE_X, i * BLOCK_SIZE_y, enemy_img)
end

$score = 0

Window.loop do
  bar.update
  ball.update

  player.draw
  player.shot


  enemy_count = 0

  Sprite.draw($enemies)
  Sprite.draw($player_bullets)
  Sprite.draw($enemy_bullets)
  
  #Window.draw_font(10, 0, "スコア：#{$score}", font)
  #Window.draw_font(10, 32, "HP：#{$player_hp}", font) # 追加

  Sprite.check(bar, ball)
  Sprite.check(ball, blocks)
end