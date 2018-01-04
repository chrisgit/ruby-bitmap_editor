require 'spec_helper'

describe BitmapRange do
  describe '#initialize' do
    context 'parameters' do
      it_behaves_like 'class requires exact parameters', [1, 1, 250, 250]

      context 'end values before start' do
        subject { BitmapRange.new(249,250,1,2) }
        it { is_expected.to have_attributes(:start_column => 1) }
        it { is_expected.to have_attributes(:end_column => 249) }
        it { is_expected.to have_attributes(:start_row => 2) }
        it { is_expected.to have_attributes(:end_row => 250) }
      end
    end
  end

  describe '#bounds?' do
    let(:reference_range) { BitmapRange.new(1,1,20,20) }
    it_behaves_like 'range is out of bounds', 'start column zero', BitmapRange.new(0, 1, 20, 20)
    it_behaves_like 'range is out of bounds', 'end column zero', BitmapRange.new(1, 1, 0, 20)
    it_behaves_like 'range is out of bounds', 'start row zero', BitmapRange.new(1, 0, 20, 20)
    it_behaves_like 'range is out of bounds', 'end row zero', BitmapRange.new(1, 1, 20, 0)

    it_behaves_like 'range is out of bounds', 'start column greater than other', BitmapRange.new(21, 1, 21, 20)
    it_behaves_like 'range is out of bounds', 'end column greater than other', BitmapRange.new(1, 1, 21, 20)
    it_behaves_like 'range is out of bounds', 'start row greater than other', BitmapRange.new(1, 21, 20, 21)
    it_behaves_like 'range is out of bounds', 'end row greater than other', BitmapRange.new(1, 1, 20, 21)

    it_behaves_like 'range is out of bounds', 'column range overlapping', BitmapRange.new(5, 1, 25, 20)
    it_behaves_like 'range is out of bounds', 'row range overlapping', BitmapRange.new(1, 5, 20, 25)

    context 'in range' do
      it 'returns true' do
        expect(reference_range.bounds?(reference_range)).to eq(true)
      end
    end
  end
end
