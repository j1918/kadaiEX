class Bar < Sprite
    #attr_accessor :score # 追加
  
    def initialize(x, y, image) # 追加
      super
    end
  
    def update
      self.x += Input.x * 4
      if(self.x > 640 - 32)
        self.x = 640 - 32
      elsif(self.x < 0)
        self.x = 0
      end
    end
  
    def shot # 追加
      
    end
end