require 'spec_helper'

describe HorizontalLine do
  describe '#initialize' do
    context 'parameters' do
      context 'not enough passed' do
        it 'throws ArgumentError' do
          parameters = 'H 1'.split[1..-1]
          expect { HorizontalLine.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'too many passed' do
        it 'throws ArgumentError' do
          parameters = 'H 1 3 4 Z Hello'.split[1..-1]
          expect { HorizontalLine.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'exact number passed' do
        it 'returns object type of HorizontalLine' do
          parameters = 'H 1 5 4 Z'.split[1..-1]
          expect(HorizontalLine.new(*parameters)).to be_a(HorizontalLine)
        end
      end
      context 'start column greater than end column' do
        it 'transposes the values' do
          parameters = 'H 5 2 1 Z'.split[1..-1]
          hl = HorizontalLine.new(*parameters)

          expect(hl.start_column).to be(2)
          expect(hl.end_column).to be(5)
        end
      end
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError' do
        parameters = 'H 1 5 6 Z'.split[1..-1]
        command = HorizontalLine.new(*parameters)
        expect { command.execute(nil) }.to raise_error(ArgumentError)
      end
    end
    context 'bitmap is not null' do
      let(:bitmap) { Bitmap.new(10, 15) }
      context 'start column' do
        context 'less than 1' do
          it 'throws RangeError' do
            parameters = 'H 0 3 4 Z'.split[1..-1]
            command = HorizontalLine.new(*parameters)
            expect { command.execute(bitmap) }.to raise_error(RangeError)
          end
        end
        context 'greater than bitmap columns' do
          it 'throws RangeError' do
            parameters = 'H 11 3 4 Z'.split[1..-1]
            command = HorizontalLine.new(*parameters)
            expect { command.execute(bitmap) }.to raise_error(RangeError)
          end
        end
      end
      context 'end column' do
        context 'less than 1' do
          it 'throws RangeError' do
            parameters = 'H 3 0 4 Z'.split[1..-1]
            command = HorizontalLine.new(*parameters)
            expect { command.execute(bitmap) }.to raise_error(RangeError)
          end
        end
        context 'greater than bitmap columns' do
          it 'throws RangeError' do
            parameters = 'H 3 11 4 Z'.split[1..-1]
            command = HorizontalLine.new(*parameters)
            expect { command.execute(bitmap) }.to raise_error(RangeError)
          end
        end
      end
      context 'valid' do
        let(:bitmap) { Bitmap.new(5, 6) }
        it 'draws horizontal line' do
          parameters = 'H 1 5 3 Z'.split[1..-1]
          command = HorizontalLine.new(*parameters)
          command.execute(bitmap)
          output = ['OOOOO', 'OOOOO', 'ZZZZZ', 'OOOOO', 'OOOOO', 'OOOOO']

          expect(bitmap.dump).to eq(output)
        end
      end
    end
  end
end
