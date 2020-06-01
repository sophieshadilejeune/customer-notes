require 'csv'
csv_options = { col_sep: ';'}
filepath = "./db/listing.csv"

CSV.foreach(filepath, csv_options) do |row|
  puts "#{row[0]} | #{row[1]}"
end
