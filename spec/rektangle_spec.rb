require 'spec_helper'

RSpec.describe './rektangle' do
  let(:output) { %x(#{command}) }
  describe 'mandatory arguments sign' do
    context 'when both arguments are zero' do
      let(:command) { 'ruby ./rektangle.rb 0 0' }
      it { expect(output).to include('ArgumentSignError') }
    end
    context 'when first argument = 0 ' do
      let(:command) { 'ruby ./rektangle.rb 0 3' }
      it { expect(output).to include('ArgumentSignError') }
    end
    context 'when second argument = 0 ' do
      let(:command) { 'ruby ./rektangle.rb 3 0' }
      it { expect(output).to include('ArgumentSignError') }
    end
    context 'when first argument = -1 ' do
      let(:command) { 'ruby ./rektangle.rb -1 2' }
      it { expect(output).to include('ArgumentSignError') }
    end
    context 'when second argument = -1 ' do
      let(:command) { 'ruby ./rektangle.rb 3 -1' }
      it { expect(output).to include('ArgumentSignError') }
    end
    context 'when both arguments are negative' do
      let(:command) { 'ruby ./rektangle.rb -1 -1' }
      it { expect(output).to include('ArgumentSignError') }
    end
    context 'when height is over 9000' do
      let(:command) { 'ruby ./rektangle.rb 12 9001' }
      it { expect(output).to include('ArgumentTooBigError') }
    end
    context 'when width is over 9000' do
      let(:command) { 'ruby ./rektangle.rb 9001 23' }
      it { expect(output).to include('ArgumentTooBigError') }
    end
    context 'when 3 shapes are given' do
      let(:command) { 'ruby ./rektangle.rb 4 5 o o o' }
      it { expect(output).to include('ShapesNumberIncorrectError') }
    end
    context 'when 3 shapes are given' do
      let(:command) { 'ruby ./rektangle.rb 4 5 o o o ss a' }
      it { expect(output).to include('ShapeLengthIncorrectError') }
    end
    context 'when -h option is given' do
      let(:command) { 'ruby ./rektangle.rb -h' }
      it { expect(output).to include('Help Menu') }
      it { expect(output).to include("Rektangle by Seybol") }
    end
    context 'when --help option is given' do
      let(:command) { 'ruby ./rektangle.rb -h' }
      it { expect(output).to include('Help Menu') }
      it { expect(output).to include("Rektangle by Seybol") }
    end
    context 'when correct values are given' do
      let(:command) { 'ruby ./rektangle.rb 5 4 S E Y B O' }
      let(:expected) do
        expected = <<~STRING
          SOOOE
          O   O
          O   O
          BOOOY
        STRING
        expected
      end
      it { expect(output).to include(expected) }
    end
  end
end
