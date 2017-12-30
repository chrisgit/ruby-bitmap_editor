require 'spec_helper'

describe BitmapEditor do
  describe '#run' do
    context 'file is nil' do
      it 'returns "provide correct file" message' do
        expect { BitmapEditor.new.run(nil) }.to output(/please provide correct file/).to_stdout
      end
      context 'file does not exist' do
        it 'returns "provide correct file" message' do
          expect { BitmapEditor.new.run('examples/unit/does_not_exist.txt') }.to output(/please provide correct file/).to_stdout
        end
      end
    end
    context 'read file' do
      context 'Show bitmap' do
        context 'image not created' do
          it 'returns "There is no image" message' do
            expect { BitmapEditor.new.run('examples/unit/show.txt') }.to output(/There is no image/).to_stdout
          end
        end
      end
      context 'Unknown command' do
        it 'returns "unrecognised command" message' do
          expect { BitmapEditor.new.run('examples/unit/unknown.txt') }.to output(/unrecognised command/).to_stdout
        end
      end
      context 'Create bitmap image' do
        it 'returns new bitmap' do
          bitmap_image = "OOOOO\n" * 6

          expect { BitmapEditor.new.run('examples/unit/create.txt') }.to output(bitmap_image).to_stdout
        end
      end
      context 'Colour pixel' do
        it 'changes pixel colour at X Y' do
          bitmap_image = "OOOOO\nOOOOO\nOOSOO\nOOOOO\nOOOOO\nOOOOO\n"

          expect { BitmapEditor.new.run('examples/unit/colour.txt') }.to output(bitmap_image).to_stdout
        end
      end
      context 'Clear the image' do
        it 'reset the bitmap image to default colour' do
          bitmap_image = "OOOOO\n" * 6

          expect { BitmapEditor.new.run('examples/unit/clear.txt') }.to output(bitmap_image).to_stdout
        end
      end
      context 'Draw a horizontal line' do
        it 'changes pixel colour at X1 X2 Y' do
          bitmap_image = "OZZZO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n"

          expect { BitmapEditor.new.run('examples/unit/hline.txt') }.to output(bitmap_image).to_stdout
        end
      end
      context 'Draw a vertical line' do
        it 'changes pixel colour at X Y1 Y2' do
          bitmap_image = "OOOOO\nOOZOO\nOOZOO\nOOZOO\nOOZOO\nOOOOO\n"

          expect { BitmapEditor.new.run('examples/unit/vline.txt') }.to output(bitmap_image).to_stdout
        end
      end
      context 'integration' do
        it 'draws image' do
          bitmap_image = "OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n"

          expect { BitmapEditor.new.run('examples/integration/basic.txt') }.to output(bitmap_image).to_stdout
        end
      end
    end
  end
end
