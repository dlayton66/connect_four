require 'rspec'
require './lib/row'

describe Row do
  describe '#initialize' do
    it 'is an instance of Row' do
      new_row = Row.new

      expect(new_row).to be_a Row 
    end
  end
end