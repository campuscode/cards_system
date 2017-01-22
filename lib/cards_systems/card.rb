class Card
  CARDS_FILE = "#{ENV['HOME']}/cards.txt"
  SEPARADOR = "_|>_"
  attr_reader :front, :back
  `touch #{CARDS_FILE}`

  def initialize(front, back)
    @front = front
    @back = back
  end

  def self.save(card)
    all << card
    File.open(CARDS_FILE, "a+") do |f|
      f.puts card.to_row
    end
  end

  def self.save_all(cards)
    str_cards = cards.map(&:to_row)

    File.open(CARDS_FILE, "w") do |f|
      f << str_cards.join("\n")
    end
  end

  def self.all
    @@cards ||= File.readlines(CARDS_FILE).map do |row|
      front, back = row.chomp.split(SEPARADOR)
      Card.new(front, back)
    end
  end

  def self.delete(cards)
    _cards = all - cards
    save_all(_cards)
    @@cards = nil
  end

  def self.search(termo)
    all.select { |card| card.include?(termo) }
  end

  def include?(text)
    front.upcase.include?(text.upcase) ||
      back.upcase.include?(text.upcase)
  end

  def to_row
    "#{front}#{SEPARADOR}#{back}"
  end

  def to_s
    "Português: #{front}\nInglês: #{back}"
  end
end
