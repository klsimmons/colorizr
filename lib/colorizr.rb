class String
  @colors = {black: 30, red: 31, green: 32, yellow: 33, blue: 34, light_gray: 37, pink: 35, white: 97, light_blue: 94}

  def self.create_colors
    @colors.each do |color, num|
      self.send(:define_method, "#{color}") do
        "\e[#{num}m#{self}\e[0m"
      end
    end
  end

  String.create_colors

  def self.colors
    @colors.keys
  end

  def self.sample_colors
    @colors.each do |color, num|
      puts "This is \e[#{num}m#{color}\e[0m"
    end
  end
end


puts "John".red
puts "Paul".green
puts "George".blue
puts "Ringo".yellow

#print String.colors
String.sample_colors
