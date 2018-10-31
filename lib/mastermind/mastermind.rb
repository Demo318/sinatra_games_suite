class Mastermind
  attr_reader :secret_code, :board_guesses

  def initialize(secret_code = [])
    create_first_message(secret_code)
    @secret_code = secret_code
    @secret_code = new_secret_code if @secret_code.empty?
    new_secret_code_hash
    @board_guesses = []
    10.times do
      @board_guesses.append([[' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ']])
    end
  end

  def guess_code(player_guess)
    if already_played?(player_guess)
      @message_to_player = 'You\'ve already played that combination.'
    else
      add_combination(player_guess)
    end
    # takes array of four numbers entered by player
    # TODO: update player output message
  end

  private

  def add_combination(new_combination)
    # Add combination to board and update with validation
    next_board_line_index = find_next_board_line_index
    @board_guesses[next_board_line_index][0] = new_combination
    add_validation(next_board_line_index)
  end

  def add_validation(board_line_index)
    @board_guesses[board_line_index][0].each_with_index do |guess, ind|
      if @secret_code_hash[ind] == guess
        @board_guesses[board_line_index][1][ind] = '!'
      elsif @secret_code.include?(guess)
        @board_guesses[board_line_index][1][ind] = '#'
      else
        @board_guesses[board_line_index][1][ind] = 'X'
      end
    end
    @board_guesses[board_line_index][1].sort!
  end

  def find_next_board_line_index
    @board_guesses.each_with_index do |line, ind|
      return ind if line[0] == [' ', ' ', ' ', ' ']
    end
  end

  def already_played?(user_guessed_arr)
    already_played = false
    @board_guesses.each do |line|
      already_played = true if user_guessed_arr == line[0]
    end
    already_played
  end

  def creat_first_message(first_code)
    if first_code.empty?
      @message_to_player = 'Please enter four numbers 1-6.'
    else
      @message_to_player = 'Great, thank you for entering that code.'
    end
  end

  def new_secret_code
    code = []
    4.times do
      code << rand(1..6).to_s
    end
    code
  end

  def new_secret_code_hash
    @secret_code_hash = Hash.new
    @secret_code.each_with_index do |num, ind|
      @secret_code_hash[ind] = num
    end
  end
end
