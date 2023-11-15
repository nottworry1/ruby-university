# frozen_string_literal: true
require 'nokogiri'
require 'open-uri'
require 'csv'

def html_parse(url, csv, selector, element)
  doc = fetch_html(url)
  write_to_csv(csv, selector, element, doc)
end

def fetch_html(url)
  Nokogiri::HTML(URI.open(url))
end

def write_to_csv(csv, selector, element, doc)
  CSV.open(csv, 'w') do |c|
    elements = doc.css(selector)
    elements.search(element).each_with_index do |e, i|
      c.puts [i + 1, e.text]
    end
  end
end


html_parse('https://www.hospitalsafetygrade.org/all-hospitals', 'result.csv', 'div.column1', 'li')
puts "Програму виконано успішно"