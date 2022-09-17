class Ball < Sprite
    #attr_accessor :score # 追加
    REDIUS = 16

    def initialize(x, y, image) # 追加
      @x_vector = 1
      @y_vector = -1
      self.collision = [self.x, self.y, REDIUS]
      super
    end
  
    def update
      self.x += @x_vector
      self.y += @y_vector

      if(self.x > 640 - REDIUS)
        @x_vector *= -1
      elsif(self.x < 0 + REDIUS)
        @x_vector *= -1
      elsif(self.y > 480 - REDIUS)
        @y_vector *= -1
      elsif(self.y < 0 + REDIUS)
        @y_vector *= -1
      end
    end
  
    def hit
      @x_vector *= -1
      @y_vector *= -1
    end

end