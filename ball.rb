require_relative 'bar'
class Ball < Sprite
    attr_accessor :speed # 追加
    REDIUS = 12

    def initialize(x, y, image) # 追加
      @x_vector = 1
      @y_vector = -1
      @speed = 3
      self.collision = [self.x, self.y, REDIUS]
      super
    end
  
    def update
      self.x += @x_vector * @speed
      self.y += @y_vector * @speed

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
    
    def change_speed
      if($score >= 300)
        @speed = 6
      elsif($score >= 200)
        @speed = 5
      elsif($score >= 50)
        @speed = 4
      else
        @speed = 3
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
      if(self.y + REDIUS > y && self.y + REDIUS < y + @speed + 1 && @y_vector > 0)
        if(self.x > x && self.x < x + Bar::BAR_SIZE_X)
          @y_vector *= -1
        end
      end
    end

    def shot
      @y_vector *= -1
    end

end