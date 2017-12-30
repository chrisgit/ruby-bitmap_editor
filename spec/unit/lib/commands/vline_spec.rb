require 'spec_helper'

describe VerticalLine do
  describe '#initialize' do
    context 'parameters' do
      context 'not enough passed' do
        it 'throws ArgumentError' do
          parameters = 'V 1'.split[1..-1]
          expect { VerticalLine.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'too many passed' do
        it 'throws ArgumentError' do
          parameters = 'V 1 3 4 Z Hello'.split[1..-1]
          expect { VerticalLine.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'exact number passed' do
        it 'returns object type of VerticalLine' do
          parameters = 'V 1 5 4 Z'.split[1..-1]
          expect(VerticalLine.new(*parameters)).to be_a(VerticalLine)
        end
      end
      context 'start row greater than end row' do
        it 'transposes the values' do
          parameters = 'V 5 7 3 Z'.split[1..-1]
          vl = VerticalLine.new(*parameters)

          expect(vl.start_row).to be(3)
          expect(vl.end_row).to be(7)
        end
      end
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError' do
        parameters = 'V 1 5 6 Z'.split[1..-1]
        command = VerticalLine.new(*parameters)
        expect { command.execute(nil) }.to raise_error(ArgumentError)
      end
    end
    context 'bitmap is not null' do
      let(:bitmap) { Bitmap.new(5, 6) }
      context 'start row' do
        context 'less than 1' do
          it 'throws RangeError' do
            parameters = 'V 3 0 5 Z'.split[1..-1]
            command = VerticalLine.new(*parameters)
            expect { command.execute(bitmap) }.to raise_error(RangeError)
          end
        end
        context 'greater than bitmap rows' do
          it 'throws RangeError' do
            parameters = 'V 3 7 5 Z'.split[1..-1]
            command = VerticalLine.new(*parameters)
            expect { command.execute(bitmap) }.to raise_error(RangeError)
          end
        end
      end
      context 'end row' do
        context 'less than 1' do
          it 'throws RangeError' do
            parameters = 'V 3 2 0 Z'.split[1..-1]
            command = VerticalLine.new(*parameters)
            expect { command.execute(bitmap) }.to raise_error(RangeError)
          end
        end
        context 'greater than bitmap rows' do
          it 'throws RangeError' do
            parameters = 'V 3 2 7 Z'.split[1..-1]
            command = VerticalLine.new(*parameters)
            expect { command.execute(bitmap) }.to raise_error(RangeError)
          end
        end
      end
    end
  end
end
