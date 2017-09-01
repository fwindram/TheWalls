
require 'squib'
# require 'game_icons'

# data = xlsx file: 'E:\Francis\Games\TheWallsConcept.xlsx'   # Needs to be wrapped in a Squib tag
data = Squib.csv file: 'TheWallsConcept.csv'

buildstring = Time.now.strftime("%d%m%y%H%M")   # Create buildstring
pdfgen = true

Squib::Deck.new cards: data['Title'].size, layout: 'layout.yml' do
  background color: 'white'
  rect layout: 'cut' # cut line as defined by TheGameCrafter - poker cards
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['Title'], layout: 'title'
  text str: data['Type'], layout: 'type'
  # icons = data['Gameicon']
  # svg file: icons.each {|x| GameIcons.get(x).file}, layout: 'art'
  svg file: data['Svgpath'], layout: 'art'
  text str: data['Effect'], layout: 'effect'
  text str: data['Description'], layout: 'description'
  text str: data['Details'], layout: 'details'
  save_png dir: "testdecks/build_#{buildstring}"
  if pdfgen
    save_pdf dir: "testdecks/build_#{buildstring}", trim: 37.5
  end
end
