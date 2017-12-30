require 'spec_helper'

describe Clear do
  describe '#initialize' do
    context 'parameters' do
      context 'too many passed' do
        it 'throws ArgumentError' do
          parameters = 'C 5'.split[1..-1]
          expect { Clear.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'exact number passed' do
        it 'returns object type of Clear' do
          parameters = 'C'.split[1..-1]
          expect(Clear.new(*parameters)).to be_a(Clear)
        end
      end
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError' do
        command = Clear.new
        expect { command.execute(nil) }.to raise_error(ArgumentError)
      end
    end
    context 'bitmap is not null' do
      it 'resets bitmap to default cell values' do
        bitmap = BitmapTestHelper.create_and_fill(5, 6, '!')
        command = Clear.new
        command.execute(bitmap)

        expect(bitmap.dump).to eq(Array.new(6, 'OOOOO'))
      end
    end
  end
end
