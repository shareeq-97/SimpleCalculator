# to run the file you should have ruby installed
# to run use command 'ruby simple_calculator.rb "1,2"'

require "pry"

class SimpleCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    delimiters = [",", "\n"]

    numbers = numbers.gsub("\\n", "\n")

    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      custom_delimiter = delimiter_line[2..-1]
      delimiters.push(custom_delimiter)
    end

    if numbers.include?(",\\n") || numbers.include?(",\n")
      raise "Input invalid"
    end

    numbers_array = split_numbers(numbers, delimiters)

    negatives = numbers_array.select { |num| num.to_i.negative? }
    raise "negative numbers not allowed #{negatives.join(",")}" if negatives.any?

    numbers_array.map(&:to_i).sum
  end

  private

  def self.split_numbers(numbers, delimiters)
    return [] if numbers.nil? || numbers.empty?

    delimiters.each do |delimiter|
      numbers = numbers.gsub(delimiter, ",")
    end

    numbers.split(",")
  end
end

if __FILE__ == $0
  input = ARGV[0]

  begin
    puts SimpleCalculator.add(input)
  rescue StandardError => e
    puts e.message
  end
end
