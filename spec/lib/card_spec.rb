require_relative '../../lib/cards_systems/card'

describe Card do
  subject { described_class.new(front, back) }
  let(:front) { 'Gato' }
  let(:back) { 'Cat' }

  describe "#front" do
    it { expect(subject.front).to eq front }
  end

  describe "#back" do
    it { expect(subject.back).to eq back }
  end

  describe "#to_row" do
    it { expect(subject.to_row).to eq "Gato#{Card::SEPARATOR}Cat" }
  end

  describe "#to_s" do
    it { expect(subject.to_s).to eq "Português: #{front}\nInglês: #{back}" }
  end

  describe "#include" do
    it { expect(subject).to be_include "Gato" }
    it { expect(subject).to be_include "Cat" }
    it { expect(subject).to be_include "CAT" }
    it { expect(subject).to be_include "GATO" }
    it { expect(subject).to be_include "TO" }
    it { expect(subject).not_to be_include "tac" }
    it { expect(subject).not_to be_include "jato" }
  end
end
