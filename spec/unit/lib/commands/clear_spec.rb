require 'spec_helper'

describe Clear do
  describe '#initialize' do
    context 'parameters' do
      context 'too many passed' do
        it 'throws ArgumentError' do
          parameters = 'C 5'.split[1..-1]
          expect { Clear.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'exact number passed' do
        it 'returns object type of Clear' do
          parameters = 'C'.split[1..-1]
          expect(Clear.new(*parameters)).to be_a(Clear)
        end
      end
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError' do
        command = Clear.new
        expect { command.execute(nil) }.to raise_error(ArgumentError)
      end
    end
  end
end
