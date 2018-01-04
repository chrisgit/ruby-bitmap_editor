require 'spec_helper'

describe NilBitmap do
  let (:bitmap) { NilBitmap.new }

  it_behaves_like 'bitmap'

  describe '#initialize' do
    it_behaves_like 'bitmap initialized', 0, 0
  end

  describe '#dump' do
    it 'returns "There is no image"' do
      expect(bitmap.dump).to eq('There is no image')
    end
  end

  describe '#colour_pixel' do
    it 'throws ArgumentError"' do
      expect { bitmap.colour_pixel(1, 1, 'O') }.to raise_error(ArgumentError)
    end
  end

  describe '#clear' do
    it 'throws ArgumentError"' do
      expect { bitmap.clear }.to raise_error(ArgumentError)
    end
  end

  describe '#draw' do
    it 'throws ArgumentError"' do
      expect { bitmap.draw(Range.new(1,1,5,5), 'O') }.to raise_error(ArgumentError)
    end
  end
end
