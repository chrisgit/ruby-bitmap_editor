require 'spec_helper'

describe 'bitmap' do
  describe '#initialize' do
    it 'creates new bitmap of size M N' do
      bitmap = Bitmap.new(5, 6)
      expect(bitmap.columns).to eq(5)
      expect(bitmap.rows).to eq(6)
    end
  end
end
