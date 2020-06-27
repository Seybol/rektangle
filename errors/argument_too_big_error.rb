class ArgumentTooBigError < ArgumentError
  def initialize(msg = nil)
    message = "Height or width is too big."
    super(message)
  end
end