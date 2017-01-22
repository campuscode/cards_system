require "cards_systems/version"
require 'cards_systems/card'
require "cards_systems/main"

module CardsSystems
  module_function
  def run
    Main.new.init
  end
end
