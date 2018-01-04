require 'spec_helper'

describe NilBitmap do
  let (:bitmap) { NilBitmap.new }
  describe '#initialize' do
    it 'creates new bitmap of size 0 0' do
      expect(bitmap.columns).to eq(0)
      expect(bitmap.rows).to eq(0)
    end
  end

  it_behaves_like 'bitmap'

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
