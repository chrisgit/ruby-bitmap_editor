require 'spec_helper'

describe Command do
  describe '#initialize' do
    context 'command only' do
      it 'sets command' do
        instruction = Command.new('C')
        expect(instruction.command).to eq('C')
        expect(instruction.parameters).to be_empty
      end
    end
    context 'command and parameters' do
      it 'sets command and parameters' do
        instruction = Command.new('H 1 2 3 O')
        expect(instruction.command).to eq('H')
        expect(instruction.parameters).to eq(['1', '2', '3', 'O'])
      end
    end
  end
end
