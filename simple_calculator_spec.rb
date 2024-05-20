# pls install rspec gem before running the file
# command to install rspec "gem install rspec"
# to run the file pls use command "rspec simple_calculator_spec.rb"

require_relative 'simple_calculator'
require 'rspec'

RSpec.describe SimpleCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(SimpleCalculator.add("")).to eq(0)
    end

    it 'returns 0 for a nil input' do
      expect(SimpleCalculator.add(nil)).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(SimpleCalculator.add("1")).to eq(1)
      expect(SimpleCalculator.add("5")).to eq(5)
    end

    it 'returns the sum of two numbers' do
      expect(SimpleCalculator.add("1,2")).to eq(3)
      expect(SimpleCalculator.add("10,20")).to eq(30)
    end

    it 'returns the sum of multiple numbers' do
      expect(SimpleCalculator.add("1,2,3")).to eq(6)
      expect(SimpleCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'handles new lines between numbers' do
      expect(SimpleCalculator.add("1\n2,3")).to eq(6)
      expect(SimpleCalculator.add("1,2\n3")).to eq(6)
    end

    it 'handles custom delimiters' do
      expect(SimpleCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      expect { SimpleCalculator.add("1,-2,3") }.to raise_error("negative numbers not allowed -2")
      expect { SimpleCalculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed -2,-3")
    end
  end
end
