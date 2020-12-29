# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/CombatDeck.csv'
layouts = ['combatdeck.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts do
  background layout: data['type']
  rect layout: 'block'
  title_size = data['name'].map do |name|
    case name.length
    when 0..12 then 'title'
    when 12..1000 then 'title-sm'
    end
  end
  text str: data['name'], layout: title_size
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
  desc_size = data['description'].map do |description|
    case description.length
    when 0..100 then 'description'
    when 100..1000 then 'description-sm'
    end
  end
  text str: data['description'], layout: desc_size
  svg layout: 'costicon'
  text str: data['cost'], layout: 'cost'
  svg layout: 'playcosticon'
  text str: data['playcost'], layout: 'playcost'
  save_png prefix: 'combatdeck_', dir: '_output/combatdeck'
  save_pdf trim: '0.125in', dir: '_output/combatdeck', file: 'combatdeck.pdf'
  save_sheet trim: '0.125in', dir: '_output/combatdeck/00_68',
             columns: 10, range: 0..68
  save_sheet trim: '0.125in', dir: '_output/combatdeck/69_137',
             columns: 10, range: 69..137
  save_sheet trim: '0.125in', dir: '_output/combatdeck/138_183',
             columns: 10, range: 138..183
end
