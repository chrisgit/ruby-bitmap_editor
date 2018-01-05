require 'spec_helper'

describe Colour do
  describe '#initialize' do
    context 'parameters' do
      it_behaves_like 'class requires exact parameters', ['3', '5', 'C']
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError"' do
        command = Colour.new(*['5', '6', 'C'])
        expect { command.execute(NilBitmap.new) }.to raise_error(ArgumentError)
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
