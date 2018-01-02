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

  describe '#clear' do
    it 'resets bitmap colours to default' do
      bitmap = BitmapTestHelper.create_and_fill(5, 6, '!')
      bitmap.clear()

      expect(bitmap.dump).to eq(Array.new(6, 'OOOOO'))
    end
  end

  describe '#draw_horizontal' do
    context 'parameters' do
      context 'start column' do
        context 'less than 1' do
          it 'throws RangeError' do
            expect { bitmap.draw_horizontal(0, 3, 4, 'O') }.to raise_error(RangeError)
          end
        end
        context 'greater than bitmap columns' do
          it 'throws RangeError' do
            expect { bitmap.draw_horizontal(11, 3, 4, 'O') }.to raise_error(RangeError)
          end
        end
      end
      context 'end column' do
        context 'less than 1' do
          it 'throws RangeError' do
            expect { bitmap.draw_horizontal(3, 0, 4, 'O') }.to raise_error(RangeError)
          end
        end
        context 'greater than bitmap columns' do
          it 'throws RangeError' do
            expect { bitmap.draw_horizontal(2, 11, 4, 'O') }.to raise_error(RangeError)
          end
        end
      end
      context 'valid' do
        it 'draws horizontal line' do
          bitmap.draw_horizontal(1, 5, 3, 'Z')
          output = ['OOOOO', 'OOOOO', 'ZZZZZ', 'OOOOO', 'OOOOO', 'OOOOO']

          expect(bitmap.dump).to eq(output)
        end
      end
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
