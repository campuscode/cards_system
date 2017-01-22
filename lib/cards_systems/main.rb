class Main
  INSERIR_CARD = "1"
  VISUALIZAR_CARDS = "2"
  PESQUISAR_CARD = "3"
  EXCLUIR_CARDS = "4"
  CARDS_POR_PAGINA = 3
  SAIR = "5"

  def initialize
    puts 'Bem vindo ao Cards Systems'
    puts
    puts
    puts 'Pressione qualquer tecla para continuar'
    gets
  end

  def init
    while true
      opcao = menu
      case opcao
      when INSERIR_CARD
        insert_card
      when VISUALIZAR_CARDS
        show_cards(Card.all)
      when EXCLUIR_CARDS
        delete_cards
      when PESQUISAR_CARD
        show_cards(search_card)
      when SAIR
        exit 0
      end
    end
  end

  private

  def insert_card
    puts "Card em Portugues"
    front = ler_texto
    puts "Card em Ingles"
    back = ler_texto
    card = Card.new(front, back)
    Card.save(card)
    clear
    puts "Card inserido: "
    puts
    mostra_card card
  end
  def ler_texto
    gets.chomp
  end

  def clear
    system('clear')
  end

  def show_cards(cards)
    puts "Mostrando #{cards.size} cards"
    puts
    cards.each_with_index do |card, index|
      wait_keydown if index % CARDS_POR_PAGINA == 0 && index != 0
      puts "-" * 20
      puts card
      puts "-" * 20
    end
    puts
    puts "*****  Fim da lista *****" if cards.size > 0
    wait_keydown
  end

  def mostra_card(card)
    puts card
    wait_keydown
  end

  def wait_keydown
    puts
    puts 'Pressione qualquer tecla para continuar'
    gets
  end

  def search_card
    puts "Opção: #{PESQUISAR_CARD}"
    puts 'Pesquisando Cards'
    puts
    print 'Digite o termo: '
    termo = ler_texto
    clear
    puts "Mostrando cards para: #{termo}"
    puts
    Card.search(termo)
  end

  def delete_cards
    puts "Digite o termo:"
    termo = ler_texto
    cards = Card.search(termo)
    Card.delete(Card.search(termo))
    puts "#{cards.count} excluído(s)!"
    wait_keydown
  end

  def menu
    clear
    puts "           Cards Systems"
    puts
    puts "[#{INSERIR_CARD}] Inserir um Card"
    puts "[#{VISUALIZAR_CARDS}] Visualizar Todos Cards"
    puts "[#{PESQUISAR_CARD}] Pesquisar Card"
    puts "[#{EXCLUIR_CARDS}] Excluir Cards"
    puts "[#{SAIR}] Sair"
    puts
    print "Escolha uma opcao: "
    opcao = ler_texto
    clear
    opcao
  end
end
