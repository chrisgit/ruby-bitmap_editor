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

shared_examples 'file is invalid' do |file|
  context file || 'nil' do
    it 'returns "please provide correct file" message' do
      expect { BitmapEditor.new.run(file) }.to output(/please provide correct file/).to_stdout
    end
  end
end

shared_examples 'file is valid' do |file, result, message = 'matches desired output'|
  context file do
    it message do
      expect { BitmapEditor.new.run(file) }.to output(result).to_stdout
    end
  end
end
