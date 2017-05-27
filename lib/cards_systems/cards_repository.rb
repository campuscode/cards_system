require 'fileutils'

class CardsRepository
  FILE_PATH = "#{ENV['HOME']}/cards.dat".freeze
  SEPARATOR = '_|>_'.freeze

  def initialize
    FileUtils.touch FILE_PATH
  end

  def delete(cards)
    _cards = all - cards
    save_all(_cards)
    @cards = nil
  end

  def save_all(cards)
    str_cards = cards.map(&:to_row)

    File.open(FILE_PATH, 'w') do |f|
      f << str_cards.join("\n")
    end
  end

  def save(card)
    File.open(FILE_PATH, 'a+') do |f|
      f.puts card.to_row
    end
  end

  def search(termo)
    all.select { |card| card.include?(termo) }
  end

  def all
    @cards ||= File.readlines(FILE_PATH).map do |row|
      front, back = row.chomp.split(Card::SEPARATOR)
      Card.new(front, back)
    end
  end
end
