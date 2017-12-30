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
    context 'parameters' do
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
      context 'colour' do
        context 'not a single character' do
          it 'throws ArgumentError' do
            expect { bitmap.colour_pixel(3, 3, 'Blue') }.to raise_error(ArgumentError)
          end
        end
        context 'not upper case' do
          it 'throws ArgumentError' do
            expect { bitmap.colour_pixel(3, 3, 'b') }.to raise_error(ArgumentError)
          end
        end
      end
      context 'valid' do
        it 'modifies bitmap' do
          # Edges plus middle
          bitmap.colour_pixel(1, 1, 'A')
          bitmap.colour_pixel(5, 1, 'B')
          bitmap.colour_pixel(3, 3, 'C')
          bitmap.colour_pixel(1, 6, 'D')
          bitmap.colour_pixel(5, 6, 'E')
          output = ['AOOOB', 'OOOOO', 'OOCOO', 'OOOOO', 'OOOOO', 'DOOOE']

          expect(bitmap.dump()).to eq(output)
        end
      end
    end
  end
end
