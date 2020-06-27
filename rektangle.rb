require_relative './rektangle/rektangle'
Dir[File.dirname(__FILE__ ) + '/errors/*.rb'].each { |file| require file }

def help_menu
  puts '~~Help Menu~~'
  puts 'Usage: ruby file_name width height [optional: shape_1 shape2 shape_3 shape_4 shape_5]'
  puts 'shape_1: top left character (Default: A)'
  puts 'shape_2: top right character (Default: B)'
  puts 'shape_3: bottom right character (Default: C)'
  puts 'shape_4: bottom left character (Default: D)'
  puts 'shape_5: border character (Default: .)'
end

begin
  if ARGV.include?('-h') || ARGV.include?('--help')
    puts "Rektangle by Seybol"
    puts help_menu
    abort
  end

  # Parse Arguments
  width = ARGV[0].to_i
  height = ARGV[1].to_i
  shapes = ARGV[2..6]

  # Error Handling
  raise ArgumentSignError if width < 1 || height < 1
  raise ArgumentTooBigError if width > 9000 || height > 9000
  shapes.each { |shape| raise ShapeLengthIncorrectError if shape.length != 1 }
  raise ShapesNumberIncorrectError unless shapes.empty? || shapes.length == 5

  rektangle = Rektangle.new(width, height, *shapes)
  puts rektangle.draw
rescue ArgumentError => e
  puts "#{e.class} -> #{e.message}"
  puts help_menu
end
