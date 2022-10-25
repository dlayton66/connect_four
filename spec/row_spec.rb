require 'rspec'
require './lib/row'

describe Row do
  describe '#initialize' do
    it 'is an instance of Row' do
      new_row = Row.new(7)

      expect(new_row).to be_a Row 
    end
    
    it 'has string of dots of dynamic length' do
      new_row_1 = Row.new(7)
      new_row_2 = Row.new(10)
      expect(new_row_1.row).to eq(".......")
      expect(new_row_2.row).to eq("..........")
    end
  end

  describe '#update_row' do
    it 
  end
end