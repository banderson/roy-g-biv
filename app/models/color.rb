class Color
  attr_accessor :r, :g, :b

  def self.get_random
    new get_random_number, get_random_number, get_random_number
  end

  def initialize(r=0, g=0, b=0)
    self.r = r
    self.g = g
    self.b = b
  end

  private

    def self.get_random_number
      rand 256
    end
end
