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
  
    def hit # 追加
      self.vanish
      $score += 10
    end
end