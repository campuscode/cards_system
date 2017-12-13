module Command
  class Delete
    include Support

    def run
      puts 'Digite o termo:'
      termo = read_text
      cards = Card.search(termo)
      Card.delete(Card.search(termo))
      puts "#{cards.count} excluído(s)!"
      wait_keydown
    end
  end
end
