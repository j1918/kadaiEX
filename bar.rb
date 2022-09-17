class Bar < Sprite
    #attr_accessor :score # 追加
    BAR_SIZE_X = 100
    BAR_SIZE_Y = 20
  
    def initialize(x, y, image) # 追加
      self.collision = [self.x, self.y, self.x + BAR_SIZE_X, self.y + BAR_SIZE_Y] 
      super
    end
  
    def update
      self.x += Input.x * 4
      if(self.x > 640 - BAR_SIZE_X)
        self.x = 640 - BAR_SIZE_X
      elsif(self.x < 0)
        self.x = 0
      end
    end
  
    def shot # 追加
      
    end
end