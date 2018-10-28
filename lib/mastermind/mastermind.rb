class Mastermind
  attr_reader :secret_code

  def initialize(secret_code = [])
    if secret_code.empty?
      @secret_code = new_secret_code
    else
      @secret_code = secret_code
    end
  end

  private

  def new_secret_code
    code = []
    4.times do
      code << rand(1..6)
    end
    code
  end
end
