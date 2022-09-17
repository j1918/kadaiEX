class Ball < Sprite
    #attr_accessor :score # 追加
  
    def initialize(x, y, image) # 追加
      #@score = 0
      @count = 0
      @hp = 10
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