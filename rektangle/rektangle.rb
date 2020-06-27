class Rektangle
  DEFAULT_SHAPES = %w[A B C D .]

  def shapes_valid?
    @shapes.length == 5
  end

  def initialize(width, height, *shapes)
    @width = width
    @height = height
    @shapes = shapes
    @shapes = shapes_valid? ? shapes : DEFAULT_SHAPES
    @top_left, @top_right, @bottom_right, @bottom_left, @border = @shapes
  end

  def draw_top_line
    top_line = ''
    top_line << @top_left
    return top_line + "\n" if @width == 1
    (@width - 2).times do
      top_line << @border
    end
    top_line << "#{@top_right}\n"
  end

  def draw_bottom_line
    bottom_line = ''
    bottom_line << @bottom_left
    return bottom_line + "\n" if @width == 1
    (@width - 2).times do
      bottom_line << @border
    end
    bottom_line << "#{@bottom_right}\n"
  end

  def draw_middle_line
    return "#{@border}\n" if @width == 1
    middle_of_line = ' ' * (@width - 2)
    "#{@border}" + middle_of_line + "#{@border}\n"
  end

  def draw_middle_lines
    middle_lines = ''
    (@height - 2).times do
      line = draw_middle_line
      middle_lines << line
    end
    middle_lines
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