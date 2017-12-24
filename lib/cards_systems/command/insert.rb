module Command
  class Insert
    include Support

    def run
      puts 'Card em Portugues'
      front = read_text
      puts 'Card em Ingles'
      back = read_text
      card = Card.new(front, back)
      Card.save(card)
      clear
      puts 'Card inserido: '
      puts
      show_card card
    end

    private

    def show_card(card)
      puts card
      wait_keydown
    end
  end
end
