require 'spec_helper'


RSpec.feature "Capybara feature test" do

    scenario "Players can enter their name and see it on screen" do
    sign_in
    expect(page).to have_content "Welcome Saul Bellow!"
    end

    scenario "PLayer should see three options to choose 'Rock','Paper' or 'Scissors'" do
    sign_in
    expect(page).to have_content "Rock Paper Scissors"
    end

    scenario "Player should by pressing one of the the three buttons learn whether they have won" do
    sign_in
    click_button "rock"
    expect(page).to have_content "Your choice: rock"
    end

    scenario "Player should win if computer chooses Rock and player chooses Paper" do
    allow_any_instance_of(Game).to receive(:randomizer).and_return('rock')
    sign_in
    click_button 'paper'
    expect(page).to have_content "player wins"
    end

    scenario "Player should loose if computer chooses Rock and player chooses Scissors" do
    allow_any_instance_of(Game).to receive(:randomizer).and_return('rock')
    sign_in
    click_button 'scissors'
    expect(page).to have_content "house wins"
    end

    scenario "Player should loose if computer chooses Rock and player chooses Scissors" do
    allow_any_instance_of(Game).to receive(:randomizer).and_return('rock')
    sign_in
    click_button 'rock'
    expect(page).to have_content "draw"
    end

end
