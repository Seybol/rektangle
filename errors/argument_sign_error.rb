class ArgumentSignError < ArgumentError
  def initialize(msg = nil)
    message = "Height or width is either zero or negative."
    super(message)
  end
end