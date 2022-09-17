require_relative 'bar'
class Ball < Sprite
    #attr_accessor :score # 追加
    REDIUS = 12

    def initialize(x, y, image) # 追加
      @x_vector = 2
      @y_vector = -2
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
      elsif(self.y < 0 + REDIUS)
        @y_vector *= -1
      #elsif(self.y > 480 - REDIUS)
        #@y_vector *= -1
      end
    end

    def gameover?
      if(self.y > 480)
        return true
      else
        return false
      end
    end

    def hit(x, y)
      if(self.y + REDIUS > y && self.y + REDIUS < y + 3 && @y_vector > 0)
        if(self.x > x && self.x < x + Bar::BAR_SIZE_X)
          @y_vector *= -1
        end
      end
    end

    def shot
      @y_vector *= -1
    end

end