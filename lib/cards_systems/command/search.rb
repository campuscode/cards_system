module Command
  class Search
    include Support

    def run
      show_cards(search_card)
    end

    private

    def search_card
      puts "Opção: #{Application::PESQUISAR_CARD}"
      puts 'Pesquisando Cards'
      puts
      print 'Digite o termo: '
      termo = read_text
      clear
      puts "Mostrando cards para: #{termo}"
      puts
      Card.search(termo)
    end
  end
end
