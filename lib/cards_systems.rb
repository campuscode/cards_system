require "cards_systems/version"
require 'cards_systems/card'
require "cards_systems/application"

module CardsSystems
  module_function
  def run
    Application.new.init
  end
end
