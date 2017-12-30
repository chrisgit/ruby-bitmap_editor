require 'spec_helper'

describe 'bitmap' do
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
  describe '#colour_pixel' do
    let(:bitmap) { Bitmap.new(5, 6) }
    context 'column' do
      context 'less than 1' do
        it 'throws RangeError' do
          expect { bitmap.colour_pixel(0, 3, 'C') }.to raise_error(RangeError)
        end
      end

      context 'greater than bitmap columns' do
        it 'throws RangeError' do
          expect { bitmap.colour_pixel(8, 3, 'C') }.to raise_error(RangeError)
        end
      end
    end

    context 'row' do
      context 'less than 1' do
        it 'throws RangeError' do
          expect { bitmap.colour_pixel(3, 0, 'C') }.to raise_error(RangeError)
        end
      end

      context 'greater than bitmap rows' do
        it 'throws RangeError' do
          expect { bitmap.colour_pixel(3, 8, 'C') }.to raise_error(RangeError)
        end
      end
    end

    context 'columns and rows within bounds' do
      it 'does not throw an error' do
        expect { bitmap.colour_pixel(3, 3, 'C') }.not_to raise_error
      end
    end
  end
end
