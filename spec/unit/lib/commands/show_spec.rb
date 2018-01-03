require 'spec_helper'

describe Show do
  describe '#initialize' do
    context 'parameters' do
      it_behaves_like 'class requires exact parameters', ['5']
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'returns "There is no image"' do
        command = Show.new
        expect { command.execute(nil) }.to output(/There is no image/).to_stdout
      end
    end
    context 'bitmap is not null' do
      it 'displays the content of bitmap' do
        bitmap = Bitmap.new(3, 3)
        command = Show.new

        expect { command.execute(bitmap) }.to output("OOO\nOOO\nOOO\n").to_stdout
      end
    end
  end
end
