require_relative './rektangle/rektangle'
Dir[File.dirname(__FILE__ ) + '/errors/*.rb'].each { |file| require file }
# TODO handle big arguments
#ruby ./rektangle 2 3 [optional]
#check arguments
begin
  width = ARGV[0].to_i
  height = ARGV[1].to_i
  if width < 1 || height < 1
    raise ArgumentSignError
  end
  if width > 9000 || height > 9000
    raise ArgumentTooBigError
  end
  rektangle = Rektangle.new(width, height)
  puts rektangle.draw
rescue ArgumentError => e
  puts "#{e.class} -> #{e.message}"
end
# if ok -> draw