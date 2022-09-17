require 'dxruby'

require_relative 'bar'
require_relative 'ball'
require_relative 'block'

font = Font.new(32)

player = Player.new(320, 400, player_img)
enemies = []

score = 0

timer = 600 + 60 # 追加

Window.loop do
  player.update

  player.draw
  player.shot

  
  if(enemy_count < 5)
    $enemies << Enemy.new(rand(0..(640 - 32 - 1)), rand((120 - 32 - 1)), enemy_img)
  end

  enemy_count = 0

  Sprite.draw($enemies)
  Sprite.draw($player_bullets)
  Sprite.draw($enemy_bullets)
  Window.draw_font(10, 0, "スコア：#{$score}", font)
  Window.draw_font(10, 32, "残り時間：#{timer / 60}秒", font) # 追加
  Window.draw_font(10, 64, "HP：#{$player_hp}", font) # 追加

  Sprite.check(player, $enemies)
  Sprite.check($player_bullets, $enemies)
  Sprite.check(player, $enemy_bullets)
end