require 'spec_helper'

describe Unknown do
  describe '#initialize' do
    context 'parameters' do
      context 'no parameters passed' do
        it 'returns object type of Unknown' do
          instruction = ''.split
          expect(Unknown.new(*instruction)).to be_a(Unknown)
        end
      end
      context 'lots of parameters passed' do
        it 'returns object type of Unknown' do
          instruction = 'One Two Three Four Five Six Seven Eight Nine Ten'.split
          expect(Unknown.new(*instruction)).to be_a(Unknown)
        end
      end
    end
  end

  describe '#execute' do
    it 'returns "unrecognised command"' do
      command = Unknown.new(nil) 
      expect { command.execute(nil) }.to output(/unrecognised command/).to_stdout
    end
  end
end
