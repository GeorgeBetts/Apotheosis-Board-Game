# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/Encounters.csv'
layouts = ['encounter.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts, dpi: 300, width: "2in", height: "2.75in" do
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
      file: data['subtype'].map { |n| n.nil? ? nil : "icons/#{n.downcase}.svg" }
  text str: data['typename'], layout: 'type'
  text str: data['description'],
      layout: data['type'].map { |n| "description_" + n}
  text str: data['subtext'], layout: 'subtext'
  svg layout: 'priorityicon'
  text str: data['priority'], layout: 'priority'
  save_png prefix: 'encounter_', dir: '_output/encounter'
  save_pdf trim: '0.125in', dir: '_output/encounter', file: 'encounter.pdf'
  save_sheet trim: '0.125in', dir: '_output/encounter/hellenic', prefix: 'encounter_1_',
             columns: 10, range: 0..68
  save_sheet trim: '0.125in', dir: '_output/encounter/hellenic', prefix: 'encounter_2_',
             columns: 10, range: 69..103
  save_sheet trim: '0.125in', dir: '_output/encounter/arcadia', prefix: 'encounter_1_',
             columns: 10, range: 104..172
  save_sheet trim: '0.125in', dir: '_output/encounter/arcadia', prefix: 'encounter_2_',
             columns: 10, range: 172..182
  save_sheet trim: '0.125in', dir: '_output/encounter/underworld', prefix: 'encounter_1_',
             columns: 10, range: 183..251
  save_sheet trim: '0.125in', dir: '_output/encounter/underworld', prefix: 'encounter_2_',
             columns: 10, range: 252..289
#   save_pdf sprue: 'sprues/drivethrucards_mini.yml', dir: '_output/encounter', file: 'dtc_mini_output.pdf'
end
