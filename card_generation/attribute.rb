# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/Attributes.csv'
layouts = ['attribute.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts, dpi: 300, width: "2.75in", height: "3.75in" do
  background color: '#e0ddd5'
  rect layout: data['name']
  text str: data['name'], layout: 'title', font: 'Palatino Linotype, Sans 18',
       color: '#e0ddd5'
  svg layout: 'art',
      file: data['name'].map { |n| n.nil? ? nil : "icons/art/#{n.downcase}.svg" }
  text str: data['description'], layout: 'description'
  save_png prefix: 'attribute_', dir: '_output/attribute'
  save_pdf trim: '0.125in', dir: '_output/attribute', file: 'attribute.pdf'  
  save_sheet trim: '0.125in', dir: '_output/attribute',
             columns: 10, range: 0..68
  save_pdf sprue: 'sprues/drivethrucards_poker.yml', dir: '_output/attribute', file: 'dtc_poker_output.pdf'
end
