require 'spec_helper'

describe Bitmap do
  let (:bitmap) { Bitmap.new(5, 6) }

  it_behaves_like 'bitmap'
  describe '#initialize' do
    it_behaves_like 'bitmap initialized', 5, 6

    it 'colour is white' do
      expect(bitmap.dump).to eq(Array.new(6, 'OOOOO'))
    end
  end

  describe '#dump' do
    it 'returns array of bitmap rows' do
      expect(bitmap.dump).to eq(Array.new(6, 'OOOOO'))
    end
  end

  describe '#draw' do
    let(:bitmap) { Bitmap.new(5, 6) }

    context 'range out of bounds' do
      it_behaves_like 'bitmap draw parameters invalid', [BitmapRange.new(3,3,7,7), 'C'], RangeError
    end

    context 'colour not valid' do
      it_behaves_like 'bitmap draw parameters invalid', [BitmapRange.new(3,3,4,5), 'Blue'], ArgumentError
    end

    context 'valid' do
      it 'modifies bitmap' do
        range = BitmapRange.new(2,2,4,4)
        # Edges plus middle
        bitmap.draw(range, 'A')
        output = ['OOOOO', 'OAAAO', 'OAAAO', 'OAAAO', 'OOOOO', 'OOOOO']

        expect(bitmap.dump()).to eq(output)
      end
    end
  end

  describe '#clear' do
    it 'resets bitmap colours to default' do
      bitmap = BitmapTestHelper.create_and_fill(5, 6, '!')
      bitmap.clear()

      expect(bitmap.dump).to eq(Array.new(6, 'OOOOO'))
    end
  end
end
