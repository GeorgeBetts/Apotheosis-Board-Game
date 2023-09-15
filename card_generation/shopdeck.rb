# frozen_string_literal: true

require 'squib'

data = Squib.csv file: 'csv/ShopDeck.csv'
layouts = ['shopdeck.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts, dpi: 300, width: "1.875in", height: "2.75in" do
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
  text str: data['description'], layout: data['type'].map { |n| "description_" + n}
  text str: data['shop'], layout: 'subtext'
  svg layout: 'costicon'
  text str: data['cost'], layout: 'cost'
  save_png prefix: 'shop_', dir: '_output/shop'
  save_pdf trim: '0.125in', dir: '_output/shop', file: 'shop.pdf'
  save_sheet trim: '0.125in', dir: '_output/shop/shopdeck/00_68', prefix: 'shop_',
             columns: 10, range: 0..68
  save_sheet trim: '0.125in', dir: '_output/shop/shopdeck/69_69', prefix: 'shop_',
             columns: 10, range: 69..69
  save_pdf sprue: 'sprues/drivethrucards_mini.yml', dir: '_output/shop', file: 'dtc_mini_output.pdf'
end
