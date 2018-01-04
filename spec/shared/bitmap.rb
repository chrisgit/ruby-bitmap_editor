##
# Classes that should behave like a bitmap
shared_examples 'bitmap' do
  it 'responds to clear' do
      expect(bitmap).to respond_to(:clear)
  end

  it 'responds to draw' do
    expect(bitmap).to respond_to(:draw)
  end

  it 'responds to dump' do
    expect(bitmap).to respond_to(:dump)
  end
end
  