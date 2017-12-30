require 'spec_helper'

describe HorizontalLine do
  describe '#initialize' do
    context 'parameters' do
      context 'not enough passed' do
        it 'throws ArgumentError' do
          parameters = 'H 1'.split[1..-1]
          expect { HorizontalLine.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'too many passed' do
        it 'throws ArgumentError' do
          parameters = 'H 1 3 4 Z Hello'.split[1..-1]
          expect { HorizontalLine.new(*parameters) }.to raise_error(ArgumentError)
        end
      end
      context 'exact number passed' do
        it 'returns object type of HorizontalLine' do
          parameters = 'H 1 5 4 Z'.split[1..-1]
          expect(HorizontalLine.new(*parameters)).to be_a(HorizontalLine)
        end
      end
    end
  end

  describe '#execute' do
    context 'bitmap is null' do
      it 'throws ArgumentError' do
        parameters = 'H 1 5 6 Z'.split[1..-1]
        command = HorizontalLine.new(*parameters)
        expect { command.execute(nil) }.to raise_error(ArgumentError)
      end
    end
  end
end
