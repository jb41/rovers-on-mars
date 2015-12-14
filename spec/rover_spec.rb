require 'spec_helper'

describe Rover do

  before :each do
    @rover = Rover.new(1, 1, 'N')
  end

  describe "#turn" do
    it "turns left if param is 'L'" do
      expect {
        @rover.turn('L')
      }.to change {
        @rover.current_position[:facing]
      }.from('N').to('W')
    end

    it "turn right if param is 'R'" do
      expect {
        @rover.turn('R')
      }.to change {
        @rover.current_position[:facing]
      }.from('N').to('E')
    end

    it "raises an exception if wrong param" do
      expect {
        @rover.turn('Q')
      }.to raise_error("Bad side.")
    end

    describe "#move" do
      correct_position_after_move = [
        { facing: 'N', x: 1, y: 2 },
        { facing: 'S', x: 1, y: 0 },
        { facing: 'E', x: 2, y: 1 },
        { facing: 'W', x: 0, y: 1 }
      ]

      correct_position_after_move.each do |correct_position|
        it "moves correctly when facing #{correct_position[:facing]}" do
          @rover = Rover.new(1, 1, correct_position[:facing])
          expect {
            @rover.move
          }.to change {
            @rover.current_position
          }.from(
            { x: 1, y: 1, facing: correct_position[:facing] }
          ).to(
            correct_position
          )
        end
      end
    end

    describe "#current_position" do
      it "returns rover's current position" do
        expect(@rover.current_position).to eq({ x: 1, y: 1, facing: 'N' })
      end
    end

  end
end
