require 'spec_helper'

describe Create do
  describe '#initialize' do
    context 'parameters' do
      it_behaves_like 'class requires exact parameters', ['3', '5']

      context 'column value' do
        it_throws_when 'less than one', ['I', 0, 5]
        it_throws_when 'greater than maximum', ['I', 251, 5]
        it_throws_when 'not a number', ['I', 'Hello', 5]
      end

      context 'rows' do
        it_throws_when 'less than one', ['I', 5, 0]
        it_throws_when 'greater than maximum', ['I', 5, 251]
        it_throws_when 'not a number', ['I', 5, 'Hello']
      end
    end
  end

  describe '#execute' do
    it 'returns new bitmap' do
      parameters = 'I 5 6'.split[1..-1]
      command = Create.new(*parameters)
      bitmap = command.execute

      expect(bitmap.columns).to eq(5)
      expect(bitmap.rows).to eq(6)
    end
  end
end
