require 'spec_helper'

RSpec.shared_examples 'a rectangle' do |*shapes|
  describe '.draw' do
    context 'when height and width are superior to 2' do
      it 'draws a 5x4 rectangle' do
        rectangle = Rektangle.new(5, 4, *shapes)
        output = rectangle.draw
        expected = <<~STRING
          A...B
          .   .
          .   .
          D...C
        STRING
        expected = convert_rectangle(expected, *shapes)
        expect(output).to eq(expected)
      end
      it 'draws a 7x3 rectangle' do
        rectangle = Rektangle.new(7, 3)
        output = rectangle.draw
        expected = <<~STRING
          A.....B
          .     .
          D.....C
        STRING
        expect(output).to eq(expected)
      end
    end
    context 'when we have an edge case' do
      context 'when height = 1 and width = 1' do
        it 'draws the top left character only' do
          rectangle = Rektangle.new(1, 1, *shapes)
          output = rectangle.draw
          expected = "A\n"
          expected = convert_rectangle(expected, *shapes)
          expect(output).to eq(expected)
        end
      end
      context 'when height = 1 and width = 5' do
        it 'draws a line of length 5' do
          rectangle = Rektangle.new(5, 1, *shapes)
          output = rectangle.draw
          expected = "A...B\n"
          expected = convert_rectangle(expected, *shapes)
          expect(output).to eq(expected)
        end
      end
      context 'when height = 5 and width = 1' do
        it 'draws a column of height 5' do
          rectangle = Rektangle.new(1, 5, *shapes)
          output = rectangle.draw
          expected = <<~STRING
            A
            .
            .
            .
            D
          STRING
          expected = convert_rectangle(expected, *shapes)
          expect(output).to eq(expected)
        end
      end
      context 'when height = 2 and width = 2' do
        it 'draws a square of 2x2 with correct characters' do
          rectangle = Rektangle.new(2, 2, *shapes)
          output = rectangle.draw
          expected = <<~STRING
            AB
            DC
          STRING
          expected = convert_rectangle(expected, *shapes)
          expect(output).to eq(expected)
        end
      end
      context 'when height = 2 and width = 1' do
        it 'draws a column of 2 with correct characters' do
          rectangle = Rektangle.new(1, 2, *shapes)
          output = rectangle.draw
          expected = <<~STRING
            A
            D
          STRING
          expected = convert_rectangle(expected, *shapes)
          expect(output).to eq(expected)
        end
      end
      context 'when height = 1 and width = 2' do
        it 'draws a line of 2 with correct characters' do
          rectangle = Rektangle.new(2, 1, *shapes)
          output = rectangle.draw
          expected = <<~STRING
            AB
          STRING
          expected = convert_rectangle(expected, *shapes)
          expect(output).to eq(expected)
        end
      end
    end
  end
end

RSpec.describe Rektangle do
  it_behaves_like 'a rectangle', '1', '2', '3', '4', 'o'
end