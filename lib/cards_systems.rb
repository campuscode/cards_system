require 'cards_systems/version'
require 'cards_systems/support'
require 'cards_systems/menu'
require 'cards_systems/command/delete'
require 'cards_systems/command/insert'
require 'cards_systems/command/quit'
require 'cards_systems/command/search'
require 'cards_systems/command/show'
require 'cards_systems/application'

autoload :Card,            'cards_systems/card'
autoload :CardsRepository, 'cards_systems/cards_repository'

module CardsSystems
  module_function

  def run
    Application.new.init
  end
end
