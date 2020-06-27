class ArgumentTooBigError < ArgumentError
  def initialize(msg = nil)
    message = "Height or width is over 9000 !"
    super(message)
  end
end