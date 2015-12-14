require 'spec_helper'

describe Rover do

  before :each do
    @plateau = Plateau.new(5, 5)
    @rover = Rover.new(1, 1, 'N', @plateau)
  end

  describe "#new" do
    it "raises an exception if wrong params" do
      expect {
        Rover.new('1', '2', 'Q', @plateau)
      }.to raise_error('Wrong arguments.')
    end
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
          @rover = Rover.new(1, 1, correct_position[:facing], @plateau)
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

    describe "#ride" do
      it "rides the rover first example path" do
        @rover = Rover.new(1, 2, 'N', @plateau)

        expect {
          @rover.ride('LMLMLMLMM')
        }.to change {
          @rover.current_position
        }.from(
          { x: 1, y: 2, facing: 'N' }
        ).to(
          { x: 1, y: 3, facing: 'N' }
        )
      end

      it "rides the rover second example path" do
        @rover = Rover.new(3, 3, 'E', @plateau)

        expect {
          @rover.ride('MMRMMRMRRM')
        }.to change {
          @rover.current_position
        }.from(
          { x: 3, y: 3, facing: 'E' }
        ).to(
          { x: 5, y: 1, facing: 'E' }
        )
      end

      it "throws exception when wrong move" do
        expect {
          @rover.ride("FooBar")
        }.to raise_error('Wrong move.')
      end
    end

  end
end
