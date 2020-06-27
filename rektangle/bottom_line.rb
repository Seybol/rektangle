module BottomLine
  def draw_bottom_line
    bottom_line = ''
    bottom_line << @bottom_left
    return bottom_line + "\n" if @width == 1
    (@width - 2).times do
      bottom_line << @border
    end
    bottom_line << "#{@bottom_right}\n"
  end
end
