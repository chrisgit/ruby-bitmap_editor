require 'spec_helper'

describe HorizontalLine do
  describe '#initialize' do
    context 'parameters' do
      it_behaves_like 'class requires exact parameters', ['1', '3', '4', 'Z']
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError' do
        command = HorizontalLine.new(*['1', '5', '5', 'Z'])
        expect { command.execute(NilBitmap.new) }.to raise_error(ArgumentError)
      end
    end
    context 'bitmap is not null' do
      let(:bitmap) { Bitmap.new(5, 6) }
      it 'draws horizontal line' do
        command = HorizontalLine.new(*['1', '5', '3', 'Z'])
        command.execute(bitmap)
        output = ['OOOOO', 'OOOOO', 'ZZZZZ', 'OOOOO', 'OOOOO', 'OOOOO']

        expect(bitmap.dump).to eq(output)
      end
    end
  end
end
