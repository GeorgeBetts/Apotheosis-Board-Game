# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/Currency.csv'
layouts = ['currency.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts do
  background color: '#e0ddd5'
  rect layout: 'cut', stroke_color: '#e0ddd5'
  rect layout: 'safe', stroke_color: '#e0ddd5'
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
#   showcase dir: '_output/currency', file: 'currency_example.png', trim: 38
  save_sheet trim: '0.125in', dir: '_output/currency',
             columns: 10, range: 0..68
end
