class Block < Sprite
    #attr_accessor :score # 追加
    BLOCK_SIZE_X = 80
    BLOCK_SIZE_Y = 20
    def initialize(x, y, image) # 追加
      self.collision = [self.x, self.y, self.x + BLOCK_SIZE_X, self.y + BLOCK_SIZE_Y] 
      super
    end
  
    def update
      self.x += Input.x * 4
      if(self.x > 640 - 32)
        self.x = 640 - 32
      elsif(self.x < 0)
        self.x = 0
      end

      @count += 1
    end
  
    def shot # 追加
      if(Input.key_down?(K_SPACE) && @count > 10)
        $player_bullets << PlayerBullet.new(self.x + 10, self.y, $player_bullet_img)
        @count = 0
      end
    end
end