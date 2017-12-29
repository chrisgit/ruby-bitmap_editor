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
      context 'Create new bitmap image' do
        it 'returns new bitmap with the correct size' do
          bitmap_editor = BitmapEditor.new
          bitmap_editor.run('examples/create.txt')
          bitmap = bitmap_editor.instance_variable_get(:@bitmap)

          expect(bitmap).not_to be_nil
          expect(bitmap.columns).to eq(5)
          expect(bitmap.rows).to eq(6)
        end
      end
    end
  end
end
