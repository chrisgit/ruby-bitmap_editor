require 'spec_helper'

describe Create do
  describe '#initialize' do
    context 'parameters' do
      context 'too many passed' do
        it 'throws ArgumentError' do
          parameters = 'I 3 5 example'.split[1..-1]
          expect { Create.new(*parameters) }.to raise_error(ArgumentError)
        end
      end

      context 'not enough passed' do
        it 'throws ArgumentError' do
          parameters = 'I 3'.split[1..-1]
          expect { Create.new(*parameters) }.to raise_error(ArgumentError)
        end
      end

      context 'columns' do
        context 'less than 1' do
          it 'throws ArgumentError' do
            parameters = 'I 0 5'.split[1..-1]
            expect { Create.new(*parameters) }.to raise_error(ArgumentError)
          end
        end
        context 'greater than 250' do
          it 'throws ArgumentError' do
            parameters = 'I 251 5'.split[1..-1]
            expect { Create.new(*parameters) }.to raise_error(ArgumentError)
          end
        end
        context 'not a number' do
          it 'throws ArgumentError' do
            parameters = 'I Hello 5'.split[1..-1]
            expect { Create.new(*parameters) }.to raise_error(ArgumentError)
          end
        end
      end

      context 'rows' do
        context 'less than 1' do
          it 'throws ArgumentError' do
            parameters = 'I 5 0'.split[1..-1]
            expect { Create.new(*parameters) }.to raise_error(ArgumentError)
          end
        end
        context 'rows greater than 250' do
          it 'throws ArgumentError' do
            parameters = 'I 5 251'.split[1..-1]
            expect { Create.new(*parameters) }.to raise_error(ArgumentError)
          end
        end
        context 'not a number' do
          it 'throws ArgumentError' do
            parameters = 'I 5 World'.split[1..-1]
            expect { Create.new(*parameters) }.to raise_error(ArgumentError)
          end
        end
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
