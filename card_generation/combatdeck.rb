# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/CombatDeck.csv'
layouts = ['combatdeck.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts, dpi: 300, width: "2.75in", height: "3.75in" do
  background layout: data['type']
  rect layout: 'block'
  text str: data['name'], layout: 'title'
  text str: data['bonus1value'], layout: 'bonus1'
  svg layout: 'bonus1icon',
      file: data['bonus1'].map { |n| n.nil? ? nil : "icons/#{n.downcase}.svg" }
  text str: data['bonus2value'], layout: 'bonus2'
  svg layout: 'bonus2icon',
      file: data['bonus2'].map { |n| n.nil? ? nil : "icons/#{n.downcase}.svg" }
  text str: data['bonus3value'], layout: 'bonus3'
  svg layout: 'bonus3icon',
      file: data['bonus3'].map { |n| n.nil? ? nil : "icons/#{n.downcase}.svg" }
  svg layout: 'art',
      file: data['name'].map { |n| n.nil? ? nil : "icons/art/#{n.downcase}.svg" }
  text str: data['description'], layout: 'description'
  svg layout: 'costicon'
  text str: data['cost'], layout: 'cost'
  svg layout: 'playcosticon'
  text str: data['playcost'], layout: 'playcost'
  save_png prefix: 'combatdeck_', dir: '_output/combatdeck'
  save_pdf trim: '0.125in', dir: '_output/combatdeck', file: 'combatdeck.pdf'
  save_sheet trim: '0.125in', dir: '_output/combatdeck', prefix: '00_68_',
             columns: 10, range: 0..68
  save_sheet trim: '0.125in', dir: '_output/combatdeck', prefix: '69_137_',
             columns: 10, range: 69..137
  save_sheet trim: '0.125in', dir: '_output/combatdeck', prefix: '138_183_',
             columns: 10, range: 138..183
  save_pdf sprue: 'sprues/drivethrucards_poker.yml', dir: '_output/combatdeck', file: 'dtc_poker_output.pdf'
end
