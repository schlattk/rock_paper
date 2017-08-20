require "././views/game.rb"

describe Game do

  it "should generate a random choice between either rock, paper or scissors" do
  game = Game.new("scissors")
  expect (game.randomizer) == "rock" || "paper" || "scissors"
  end

  it "should return 'draw' if player chooses the same outcome as randomizer" do
  game = Game.new("scissors")
  allow(game).to receive(:randomizer) {"scissors"}
  expect(game.result).to eq("draw")
  end

  it "should return 'player wins' if player chooses rock and randomizer scissors" do
  game = Game.new("rock")
  allow(game).to receive(:randomizer) {"scissors"}
  expect(game.result).to eq("player wins")
  end

  it "should return 'house wins' if player chooses paper and randomizer scissors" do
  game = Game.new("paper")
  allow(game).to receive(:randomizer) {"scissors"}
  expect(game.result).to eq("house wins")
  end

  it "should return 'draw' if both choose paper" do
  game = Game.new("paper")
  allow(game).to receive(:randomizer) {"paper"}
  expect(game.result).to eq("draw")
  end

  it "should return 'player wins' if player chooses scissors and randomizer paper" do
  game = Game.new("scissors")
  allow(game).to receive(:randomizer) {"paper"}
  expect(game.result).to eq("player wins")
  end

  it "should return 'house wins' if player chooses rock and randomizer paper" do
  game = Game.new("rock")
  allow(game).to receive(:randomizer) {"paper"}
  expect(game.result).to eq("house wins")
  end

  it "should return 'draw' if both choose rock" do
  game = Game.new("rock")
  allow(game).to receive(:randomizer) {"rock"}
  expect(game.result).to eq("draw")
  end

  it "should return 'player wins' if player chooses paper and randomizer rock" do
  game = Game.new("paper")
  allow(game).to receive(:randomizer) {"rock"}
  expect(game.result).to eq("player wins")
  end

  it "should return 'house wins' if player chooses scissors and randomizer rock" do
  game = Game.new("scissors")
  allow(game).to receive(:randomizer) {"rock"}
  expect(game.result).to eq("house wins")
  end

end
