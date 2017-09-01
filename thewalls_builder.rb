
require 'squib'

data = Squib.csv file: 'TheWallsConcept.csv'

buildstring = Time.now.strftime("%d%m%y%H%M")   # Create buildstring

# Basic Demonstration
Squib::Deck.new cards: data['Title'].size, layout: 'layout.yml' do
  background color: 'white'
  rect layout: 'cut' # cut line as defined by TheGameCrafter
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['Title'], layout: 'title'
  text str: data['Effect'], layout: 'effect'
  save_png dir: "E:/Francis/Games/TheWallsConcept/Testdecks/build_#{buildstring}"
end
