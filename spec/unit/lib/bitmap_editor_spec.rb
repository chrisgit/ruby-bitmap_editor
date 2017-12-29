require 'spec_helper'

describe BitmapEditor do
  describe '#run' do
    context 'file is nil' do
      it 'returns "provide correct file" message' do
        expect { BitmapEditor.new.run(nil) }.to output(/please provide correct file/).to_stdout
      end
      context 'file does not exist' do
        it 'returns "provide correct file" message' do
          expect { BitmapEditor.new.run('examples/does_not_exist.txt') }.to output(/please provide correct file/).to_stdout
        end
      end
    end
  end
end
