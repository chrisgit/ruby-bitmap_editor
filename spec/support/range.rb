##
# Range class bounds tests
def out_of_range(test_context, reference, comparison)
  context test_context do
    it 'returns false' do
      expect(reference.bounds?(comparison)).to eq(false)
    end
  end
end
