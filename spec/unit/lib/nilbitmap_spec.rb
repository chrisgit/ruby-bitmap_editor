require 'spec_helper'

describe NilBitmap do
  let (:nilbitmap) { NilBitmap.new }
  describe '#initialize' do
    it 'creates new bitmap of size 0 0' do
      expect(nilbitmap.columns).to eq(0)
      expect(nilbitmap.rows).to eq(0)
    end
  end

  describe '#dump' do
    it 'returns "There is no image"' do
      expect(nilbitmap.dump).to eq('There is no image')
    end
  end

  describe '#colour_pixel' do
    it 'throws ArgumentError"' do
      expect { nilbitmap.colour_pixel(1, 1, 'O') }.to raise_error(ArgumentError)
    end
  end

  describe '#clear' do
    it 'throws ArgumentError"' do
      expect { nilbitmap.clear }.to raise_error(ArgumentError)
    end
  end

  describe '#draw' do
    it 'throws ArgumentError"' do
      expect { nilbitmap.draw(Range.new(1,1,5,5), 'O') }.to raise_error(ArgumentError)
    end
  end

  describe '#draw_horizontal' do
    it 'throws ArgumentError"' do
      expect { nilbitmap.draw_horizontal(1, 2, 3, 'O') }.to raise_error(ArgumentError)
    end
  end

  describe '#draw_vertical' do
    it 'throws ArgumentError"' do
      expect { nilbitmap.draw_vertical(1, 2, 3, 'O') }.to raise_error(ArgumentError)
    end
  end
end
