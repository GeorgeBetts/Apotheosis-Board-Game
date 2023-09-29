# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/Quest.csv'
layouts = ['quest.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts, dpi: 300, width: "3.75in", height: "5.25in" do
  background color: "#2e3546"
  rect layout: 'block'
  text str: data['name'], layout: 'title'
  text str: data['description'], layout: 'description'
  save_png prefix: 'quest_', dir: '_output/quest'
end
