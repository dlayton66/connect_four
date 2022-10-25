require 'rspec'
require './lib/row'

describe Row do
  describe '#initialize' do
    it 'is an instance of Row' do
      new_row = Row.new(7)

      expect(new_row).to be_a Row 
    end
    
    it 'has string of dots of dynamic length' do
      new_row = Row.new(7)

      expect(new_row.row).to eq(".......")
    end
  end
end