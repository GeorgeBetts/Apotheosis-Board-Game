# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/Encounters.csv'
layouts = ['encounter.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts do
  background layout: data['type']
  rect layout: 'block'
  title_size = data['name'].map do |name|
    case name.length
    when 0..15 then 'title'
    when 15..1000 then 'title-sm'
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
      file: data['subtype'].map { |n| n.nil? ? nil : "icons/#{n.downcase}.svg" }
  text str: data['typename'], layout: 'type'
  desc_size = data['description'].map do |description|
    case description.length
    when 0..200 then 'description'
    when 201..300 then 'description-md'
    when 301..350 then 'description-sm'
    when 351..9999 then 'description-xs'
    end
  end
  text str: data['description'], layout: desc_size
  text str: data['subtext'], layout: 'subtext'
  svg layout: 'priorityicon'
  text str: data['priority'], layout: 'priority'
  save_png prefix: 'encounter_', dir: '_output/encounter'
  save_pdf trim: '0.125in', dir: '_output/encounter', file: 'encounter.pdf'
  save_sheet trim: '0.125in', dir: '_output/encounter/00_68', prefix: 'encounter_',
             columns: 10, range: 0..68
  save_sheet trim: '0.125in', dir: '_output/encounter/69_103', prefix: 'encounter_',
             columns: 10, range: 69..103
  save_sheet trim: '0.125in', dir: '_output/encounter/104_172', prefix: 'encounter_',
             columns: 10, range: 104..172
  save_sheet trim: '0.125in', dir: '_output/encounter/173_182', prefix: 'encounter_',
             columns: 10, range: 172..182
  save_sheet trim: '0.125in', dir: '_output/encounter/183_251', prefix: 'encounter_',
             columns: 10, range: 183..251
  save_sheet trim: '0.125in', dir: '_output/encounter/252_288', prefix: 'encounter_',
             columns: 10, range: 252..288
end
