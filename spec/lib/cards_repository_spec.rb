describe CardsRepository do
  before do
    FileUtils.rm described_class::FILE_PATH, force: true
  end
  let(:file_path){ CardsRepository::FILE_PATH  }
  let(:repository){ described_class.new }

  it 'create a file on initialize' do
    expect(File).to_not be_exist file_path
    CardsRepository.new
    expect(File).to be_exist file_path
  end

  it 'save a card' do
    described_class.new.save(Card.new('a', 'b'))
    expect(File.readlines(file_path))
      .to match ["a#{CardsRepository::SEPARATOR}b\n"]
  end

  describe '#all' do
    it 'retrieve all cards' do
      3.times do
        repository.save(Card.new('a', 'b'))
      end
      expect(repository.all.size).to eq 3
    end

    it 'does not touch file 2 times' do
      expect(File)
        .to receive(:readlines){ ["a#{CardsRepository::SEPARATOR}b\n"] }
      repository.save(Card.new('a', 'b'))
      repository.all
      expect(File).to_not receive(:readlines)
      repository.all
    end
  end

  it 'save a list of cards' do
    cards = 3.times.map{ |n| Card.new(n.to_s, n.to_s.upcase) }
    repository.save_all(cards)
    expect(repository.all.size).to eq 3
  end

  it 'delete a card' do
    cards = 3.times.map{ |n| Card.new(n.to_s, n.to_s.upcase) }
    repository.save_all(cards)
    repository.delete([cards.first])
    expect(repository.all.size).to eq 2
  end

  describe '.search' do
    it 'find 2 cards with cat' do
      repository.save(Card.new('gato', 'cat'))
      repository.save(Card.new('a', 'b'))
      repository.save(Card.new('categoria', 'category'))
      expect(repository.search('cat').size).to eq 2
      expect(repository.search('cat').first).to eq Card.new('gato', 'cat')
    end
  end
end
