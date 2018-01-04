require 'spec_helper'

describe BitmapEditor do
  describe '#run' do
    it_behaves_like 'file is invalid', nil
    it_behaves_like 'file is invalid', 'examples/unit/does_not_exist.txt'

    context 'read file' do
      it_behaves_like 'file is valid', 'examples/unit/show.txt', /There is no image/, 'returns "There is no image" message'
      it_behaves_like 'file is valid', 'examples/unit/unknown.txt', /unrecognised command/, 'returns "unrecognised command" message'

      it_behaves_like 'file is valid', 'examples/unit/create.txt', "OOOOO\n" * 6, 'Creates an image'
      it_behaves_like 'file is valid', 'examples/unit/colour.txt', "OOOOO\nOOOOO\nOOSOO\nOOOOO\nOOOOO\nOOOOO\n", 'Colours a pixel at X Y'
      it_behaves_like 'file is valid', 'examples/unit/clear.txt', "OOOOO\n" * 6, 'Clears the bitmap'
      it_behaves_like 'file is valid', 'examples/unit/hline.txt', "OZZZO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n", 'Draws a horizontal line'
      it_behaves_like 'file is valid', 'examples/unit/vline.txt', "OOOOO\nOOZOO\nOOZOO\nOOZOO\nOOZOO\nOOOOO\n", 'Draws a vertical line'
      it_behaves_like 'file is valid', 'examples/integration/basic.txt', "OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n", 'Basic integration test'
    end
  end
end
