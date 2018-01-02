require 'spec_helper'

describe PixelColour do
  context '#valid?' do
    context 'more than one character' do
      it 'false' do
        expect(PixelColour.new('Blue').valid?).to be(false)
      end
    end
    context 'single character' do
      context 'not upper case' do
        it 'false' do
          expect(PixelColour.new('b').valid?).to be(false)
        end
      end
      context 'upper case' do
        it 'false' do
          expect(PixelColour.new('B').valid?).to be(true)
        end
      end
    end
  end
end