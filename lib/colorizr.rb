class String
  @colors = {
    black: 30,
    red: 31,
    green: 32,
    yellow: 33,
    blue: 34,
    pink: 35,
    light_gray: 37,
    light_blue: 94,
    white: 97
  }

  def self.create_colors
    @colors.each do |color, num|
      self.send(:define_method, color) do
        "\e[#{num}m#{self}\e[0m"
      end
    end
  end

  String.create_colors

  def self.colors
    return @colors.keys
  end

  def self.sample_colors
    @colors.each do |color, num|
      puts "This is " +  "#{color}".send(color)
    end
  end
end

String.sample_colors
