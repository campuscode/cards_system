module Support
  CARDS_POR_PAGINA = 3

  def read_text
    gets.chomp
  end

  def clear
    system('clear')
  end

  def wait_keydown
    puts
    puts 'Pressione qualquer tecla para continuar'
    gets
  end

  def show_cards(cards)
    puts "Mostrando #{cards.size} cards"
    puts
    cards.each_with_index do |card, index|
      wait_keydown if index % CARDS_POR_PAGINA == 0 && index != 0
      puts '-' * 20
      puts card
      puts '-' * 20
    end
    puts
    puts '*****  Fim da lista *****' unless cards.empty?
    wait_keydown
  end
end
