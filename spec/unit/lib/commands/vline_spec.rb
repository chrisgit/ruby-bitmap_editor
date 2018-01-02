require 'spec_helper'

describe VerticalLine do
  describe '#initialize' do
    context 'parameters' do
      context 'not enough passed' do
        it 'throws ArgumentError' do
          expect { VerticalLine.new(*['1']) }.to raise_error(ArgumentError)
        end
      end
      context 'too many passed' do
        it 'throws ArgumentError' do
          expect { VerticalLine.new(*['1', '3', '4', 'Z', 'Hello']) }.to raise_error(ArgumentError)
        end
      end
      context 'exact number passed' do
        it 'returns object type of VerticalLine' do
          expect(VerticalLine.new(*['1', '5', '4', 'Z'])).to be_a(VerticalLine)
        end
      end
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError' do
        command = VerticalLine.new(*['1', '5', '6', 'Z'])
        expect { command.execute(nil) }.to raise_error(ArgumentError)
      end
    end
    context 'bitmap is not null' do
      let(:bitmap) { Bitmap.new(5, 6) }
      it 'draws vertical line' do
        command = VerticalLine.new(*['4', '5', '3', 'Z'])
        command.execute(bitmap)
        output = ['OOOOO', 'OOOOO', 'OOOZO', 'OOOZO', 'OOOZO', 'OOOOO']

        expect(bitmap.dump).to eq(output)
      end
    end
  end
end
