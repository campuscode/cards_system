class Card
  SEPARATOR = "_|>_"
  attr_reader :front, :back

  def initialize(front, back)
    @front = front
    @back = back
  end

  def self.repository(repository = nil)
    @repository ||= repository || CardsRepository.new
  end

  def self.save(card)
    repository.save(card)
  end

  def self.save_all(cards)
    repository.save_all(card)
  end

  def self.all
    repository.all
  end

  def self.delete(cards)
    repository.delete(cards)
  end

  def self.search(termo)
    repository.search(termo)
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
