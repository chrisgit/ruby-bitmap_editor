require 'spec_helper'

describe Bitmap do
  let (:bitmap) { Bitmap.new(5, 6) }
  describe '#initialize' do
    it 'creates new bitmap of size M N' do
      expect(bitmap.columns).to eq(5)
      expect(bitmap.rows).to eq(6)
    end

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
      it 'throws RangeError' do
        range = BitmapRange.new(3,3,7,7)
        expect { bitmap.draw(range, 'C') }.to raise_error(RangeError)
      end
    end
    context 'colour not valid' do
      it 'throws ArgumentError' do
        range = BitmapRange.new(3,3,4,5)
        expect { bitmap.draw(range, 'Blue') }.to raise_error(ArgumentError)
      end
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

  describe '#draw_vertical' do
    context 'start row' do
      context 'less than 1' do
        it 'throws RangeError' do
          expect { bitmap.draw_vertical(3, 0, 5, 'O') }.to raise_error(RangeError)
        end
      end
      context 'greater than bitmap rows' do
        it 'throws RangeError' do
          expect { bitmap.draw_vertical(3, 7, 5, 'O') }.to raise_error(RangeError)
        end
      end
    end
    context 'end row' do
      context 'less than 1' do
        it 'throws RangeError' do
          expect { bitmap.draw_vertical(3, 2, 0, 'O') }.to raise_error(RangeError)
        end
      end
      context 'greater than bitmap rows' do
        it 'throws RangeError' do
          expect { bitmap.draw_vertical(3, 2, 7, 'O') }.to raise_error(RangeError)
        end
      end
    end
    context 'valid' do
      let(:bitmap) { Bitmap.new(5, 6) }
      it 'draws vertical line' do
        bitmap.draw_vertical(4, 5, 3, 'Z')
        output = ['OOOOO', 'OOOOO', 'OOOZO', 'OOOZO', 'OOOZO', 'OOOOO']

        expect(bitmap.dump).to eq(output)
      end
    end
  end
end
