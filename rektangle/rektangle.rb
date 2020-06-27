require_relative 'middle_lines.rb'
require_relative 'bottom_line.rb'
require_relative 'top_line.rb'

class Rektangle
  include MiddleLines
  include BottomLine
  include TopLine
  DEFAULT_SHAPES = %w[A B C D .]

  def initialize(width, height, *shapes)
    @width = width
    @height = height
    @shapes = shapes
    @shapes = shapes.empty? ? DEFAULT_SHAPES : shapes
    @top_left, @top_right, @bottom_right, @bottom_left, @border = @shapes
  end

  def draw
    return "#{@top_left}\n" if @width == 1 && @height == 1
    return draw_top_line if @height == 1
    top_line = draw_top_line
    middle_lines = draw_middle_lines
    bottom_line = draw_bottom_line
    top_line + middle_lines + bottom_line
  end
end