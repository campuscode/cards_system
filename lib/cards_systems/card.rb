class Card
  SEPARATOR = "_|>_"
  attr_reader :front, :repository, :back

  class << self
    extend Forwardable
    def_delegators :repository, :save, :save_all, :delete, :search, :all
  end

  def initialize(front, back)
    @front = front
    @back = back
  end

   def self.repository(repository = nil)
     @repository = repository || @repository || CardsRepository.new
   end

  def include?(text)
    front.upcase.include?(text.upcase) ||
      back.upcase.include?(text.upcase)
  end

  def to_row
    "#{front}#{SEPARATOR}#{back}"
  end

  def hash
    front.hash + back.hash
  end

  def eql?(other)
    front == other.front && back == other.back
  end

  def ==(other)
    eql? other
  end

  def to_s
    "Português: #{front}\nInglês: #{back}"
  end
end
