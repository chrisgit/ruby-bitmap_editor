require 'spec_helper'

describe BitmapEditor do
  describe '#run' do
    context 'file is nil' do
      it 'returns "provide correct file" message' do
        expect { BitmapEditor.new.run(nil) }.to output(/please provide correct file/).to_stdout
      end
    end
  end
end
