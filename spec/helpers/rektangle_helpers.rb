module RektangleHelpers
  def convert_rectangle(target, *shapes)
    top_left, top_right, bottom_right, bottom_left, border = shapes
    target.gsub!('A', top_left)
    target.gsub!('B', top_right)
    target.gsub!('C', bottom_right)
    target.gsub!('D', bottom_left)
    target.gsub!('.', border)
    target
  end
end