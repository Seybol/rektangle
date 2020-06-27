module MiddleLines
  def draw_middle_lines
    middle_lines = ''
    (@height - 2).times do
      line = draw_middle_line
      middle_lines << line
    end
    middle_lines
  end

  def draw_middle_line
    return "#{@border}\n" if @width == 1
    middle_of_line = ' ' * (@width - 2)
    "#{@border}" + middle_of_line + "#{@border}\n"
  end
end
