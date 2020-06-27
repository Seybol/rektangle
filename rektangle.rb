require_relative './rektangle/rektangle'
Dir[File.dirname(__FILE__ ) + '/errors/*.rb'].each { |file| require file }

def help_menu
  puts '~~Help Menu~~'
  puts 'Usage: ruby file_name width height [optional: shape_1 shape2 shape_3 shape_4 shape_5]'
  puts 'shape_1: top left character'
  puts 'shape_2: top right character'
  puts 'shape_3: bottom right character'
  puts 'shape_4: bottom left character'
  puts 'shape_5: border character'
end

begin
  if ARGV.include?('-h') || ARGV.include?('--help')
    puts "Rektangle by Seybol"
    puts help_menu
    abort
  end
  width = ARGV[0].to_i
  height = ARGV[1].to_i

  if width < 1 || height < 1
    raise ArgumentSignError
  end

  if width > 9000 || height > 9000
    raise ArgumentTooBigError
  end
  shapes = ARGV[2..6]
  shapes.each do |shape|
    raise ShapeLengthIncorrectError if shape.length != 1
  end
  if shapes.empty? || shapes.length == 5
    rektangle = Rektangle.new(width, height)
    puts rektangle.draw
  else
    puts 'hello'
    raise ShapesNumberIncorrectError
  end
rescue ArgumentError => e
  puts "#{e.class} -> #{e.message}"
  puts help_menu
end
# if ok -> draw