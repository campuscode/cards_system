require 'cards_systems/version'
require 'cards_systems/application'

autoload :Card,            'cards_systems/card'
autoload :CardsRepository, 'cards_systems/cards_repository'

module CardsSystems
  module_function

  def run
    Application.new.init
  end
end
