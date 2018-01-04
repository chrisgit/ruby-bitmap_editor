##
# Bitmap range bounds checks
shared_examples 'range is out of bounds' do |test_context, comparison|
  context test_context do
    it 'returns false' do
      expect(reference_range.bounds?(comparison)).to eq(false)
    end
  end
end
