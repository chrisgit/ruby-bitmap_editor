require 'spec_helper'

describe Colour do
  describe '#initialize' do
    context 'parameters' do
      context 'too many passed' do
        it 'throws ArgumentError' do
          parameters = 'L 3 5 C example'.split[1..-1]
          expect { Colour.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'not enough parameter passed' do
        it 'throws ArgumentError' do
          parameters = 'L 3 5'.split[1..-1]
          expect { Colour.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError"' do
        parameters = 'L 5 6 C'.split[1..-1]
        command = Colour.new(*parameters)
        expect { command.execute(nil) }.to raise_error(ArgumentError)
      end
    end
    context 'bitmap is not null' do
      it 'colours pixel at X Y' do
        bitmap = Bitmap.new(5, 6)
        command = Colour.new(2, 2, 'B')
        command.execute(bitmap)
        output = ['OOOOO', 'OBOOO', 'OOOOO', 'OOOOO', 'OOOOO', 'OOOOO']

        expect(bitmap.dump).to eq(output)
      end
    end
  end
end
