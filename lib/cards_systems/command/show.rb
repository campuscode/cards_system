module Command
  class Show
    include Support

    def run
      show_cards(Card.all)
    end
  end
end
