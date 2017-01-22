require_relative '../../lib/cards_systems/card'

describe Card do
  subject { described_class.new(front, back) }
  let(:front) { 'Gato' }
  let(:back) { 'Cat' }
  it { expect(subject.front).to eq front }
end
