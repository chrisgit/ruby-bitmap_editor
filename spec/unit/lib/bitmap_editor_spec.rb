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
    context 'read file' do
      context 'Show bitmap' do
        context 'image not created' do
          it 'returns "There is no image" message' do
            expect { BitmapEditor.new.run('examples/show.txt') }.to output(/There is no image/).to_stdout
          end
        end
      end
      context 'Unknown command' do
        it 'returns "unrecognised command" message' do
          expect { BitmapEditor.new.run('examples/unknown.txt') }.to output(/unrecognised command/).to_stdout
        end
      end
    end
  end
end