##
# Classes that require the exact number of parameters
# Argument exception thrown if illegal number parameters passed
shared_examples 'class requires exact parameters' do |params|
  # If no parameters are required to construct this class then this test is not required
  if params.length > 1
    context 'not enough passed' do
      it 'throws ArgumentError' do
        expect { described_class.new(*params[1]) }.to raise_error(ArgumentError)
      end
    end
  end
  context 'too many passed' do
    it 'throws ArgumentError' do
      expect { described_class.new(*params) }.to raise_error(ArgumentError)
    end
  end
  context 'exact number passed' do
    it 'returns object type of HorizontalLine' do
      expect(described_class.new(*params[0..-2])).to be_a(described_class)
    end
  end
end
