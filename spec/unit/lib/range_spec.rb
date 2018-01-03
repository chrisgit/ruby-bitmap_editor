require 'spec_helper'
require 'support/range'

describe Range do
  describe '#initialize' do
    context 'parameters' do
      it_behaves_like 'class requires exact parameters', [1, 1, 250, 250, 'Hello']

      context 'end values before start' do
        it 'transposes value' do
          range = Range.new(249,250,1,2)
          expect(range.start_column).to eq(1)
          expect(range.start_row).to eq(2)
          expect(range.end_column).to eq(249)
          expect(range.end_row).to eq(250)
        end
      end
    end
  end

  describe '#bounds?' do
    out_of_range('start column less', Range.new(1,1,20,20), Range.new(0, 1, 20, 20))
    out_of_range('end column less', Range.new(1,1,20,20), Range.new(1, 1, 0, 20))
    out_of_range('start row less', Range.new(1,1,20,20), Range.new(1, 0, 20, 20))
    out_of_range('end row less', Range.new(1,1,20,20), Range.new(1, 1, 20, 0))

    out_of_range('start column more', Range.new(1,1,20,20), Range.new(21, 1, 21, 20))
    out_of_range('end column more', Range.new(1,1,20,20), Range.new(1, 1, 21, 20))
    out_of_range('start row more', Range.new(1,1,20,20), Range.new(1, 21, 20, 21))
    out_of_range('end row more', Range.new(1,1,20,20), Range.new(1, 1, 20, 21))

    out_of_range('column overlapping', Range.new(1,1,20,20), Range.new(5, 1, 25, 20))
    out_of_range('row overlapping', Range.new(1,1,20,20), Range.new(1, 5, 20, 25))

    context 'in range' do
      let(:range) { Range.new(1,1,20,20) }
      it 'returns true' do
        expect(range.bounds?(range)).to eq(true)
      end
    end
  end
end
