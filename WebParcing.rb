# Ця програма парсить дані з сайту: https://bankchart.com.ua/finansoviy_gid/groshi_rodini/novini/chiselnist_naselennya_evropi_za_krayinami
#і записує дані у файл формату csv
require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://bankchart.com.ua/finansoviy_gid/groshi_rodini/novini/chiselnist_naselennya_evropi_za_krayinami'
page = Nokogiri::HTML(URI.open(url))
countries = page.css('td a')
populations = page.css('td:not(:has(a))').select { |td| td.text.match?(/^\d+$/) }

countries.each_with_index do |country, index|
    population = populations[index].text
    puts "#{country.text}: #{population}"
  end


csv_filename = File.expand_path('countries_data.csv', __dir__)

CSV.open(csv_filename, 'w') do |csv|

  csv << ['Country', 'Population']

  countries.each_with_index do |country, index|
    population = populations[index].text
    csv << [country.text, population]
  end
end

puts "Дані успішно забережені у файл #{csv_filename}"
