class Mastermind
  attr_reader :secret_code

  def initialize(secret_code = [])
    @secret_code = secret_code
    @secret_code = new_secret_code if secret_code.empty?
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
