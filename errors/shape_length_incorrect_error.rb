class ShapeLengthIncorrectError < ArgumentError
  def initialize(msg = nil)
    message = "You must give 0 or 5 shapes."
    super(message)
  end
end