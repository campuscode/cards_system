class Menu
  include Support

  def self.show_and_wait_option
    new.print_menu
  end

  def print_menu
    clear
    puts '           Cards Systems'
    puts
    puts "[#{Application::INSERIR_CARD}] Inserir um Card"
    puts "[#{Application::VISUALIZAR_CARDS}] Visualizar Todos Cards"
    puts "[#{Application::PESQUISAR_CARD}] Pesquisar Card"
    puts "[#{Application::EXCLUIR_CARDS}] Excluir Cards"
    puts "[#{Application::SAIR}] Sair"
    puts
    print 'Escolha uma opcao: '
    opcao = read_text
    clear
    opcao
  end
end
