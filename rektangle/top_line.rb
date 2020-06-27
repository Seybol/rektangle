module TopLine
  def draw_top_line
    top_line = ''
    top_line << @top_left
    return top_line + "\n" if @width == 1
    (@width - 2).times do
      top_line << @border
    end
    top_line << "#{@top_right}\n"
  end
end
