class Application
  include Support

  INSERIR_CARD     = '1'.freeze
  VISUALIZAR_CARDS = '2'.freeze
  PESQUISAR_CARD   = '3'.freeze
  EXCLUIR_CARDS    = '4'.freeze
  SAIR             = '5'.freeze

  OPTIONS = {
    INSERIR_CARD     => ::Command::Insert,
    VISUALIZAR_CARDS => ::Command::Show,
    PESQUISAR_CARD   => ::Command::Search,
    EXCLUIR_CARDS    => ::Command::Delete,
    SAIR             => ::Command::Quit
  }

  def initialize
    puts 'Bem vindo ao Cards Systems'
    puts
    puts
    puts 'Pressione qualquer tecla para continuar'
    gets
  end

  def init
    loop do
      option = Menu.show_and_wait_option
      operation = OPTIONS[option]

      if operation.nil?
        puts 'Opção inválida!'
        wait_keydown
      else
        operation.new.run
      end
    end
  end
end
