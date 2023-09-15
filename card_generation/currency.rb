# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/Currency.csv'
layouts = ['currency.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts, dpi: 300, width: "2.75in", height: "3.75in" do
  background layout: data['name']
  rect layout: 'block'
  rect layout: data['name']
  text str: data['name'], layout: 'title', font: 'Palatino Linotype, Sans 18',
       color: '#2e3546'
  text str: data['value'], layout: 'value', font: 'Palatino Linotype, Sans 18',
       color: '#2e3546'
  svg layout: 'art',
      file: data['name'].map { |n| n.nil? ? nil : "icons/art/#{n.downcase}.svg" }
  svg layout: 'icon'
  svg layout: 'costicon'
  text str: data['cost'], layout: 'cost', font: 'Palatino Linotype, Sans 18',
       color: '#2e3546'
  save_png prefix: 'currency_', dir: '_output/currency'
  save_pdf trim: '0.125in', dir: '_output/currency', file: 'currency.pdf'
  save_sheet trim: '0.125in', dir: '_output/currency/00_68',
             columns: 10, range: 0..68
  save_sheet trim: '0.125in', dir: '_output/currency/69_80',
             columns: 10, range: 69..80
  save_pdf sprue: 'sprues/drivethrucards_poker.yml', dir: '_output/currency', file: 'dtc_poker_output.pdf'
end
