require 'spec_helper'

describe Show do
  describe '#initialize' do
    context 'parameters' do
      context 'too many passed' do
        it 'throws ArgumentError' do
          parameters = 'S 5'.split[1..-1]
          expect { Show.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'exact number passed' do
        it 'returns object type of Show' do
          parameters = 'S'.split[1..-1]
          expect(Show.new(*parameters)).to be_a(Show)
        end
      end
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
