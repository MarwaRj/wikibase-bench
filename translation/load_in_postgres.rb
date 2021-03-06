#!/usr/bin/env ruby

require 'json'
require 'zlib'
require 'sequel'

if ARGV.size != 1
  puts 'usage: load_in_postgres.rb <directory>'
  exit 1
end

DB = Sequel.connect('postgres://wikidata:wikidata@localhost/wikidata')

Dir['*.json.gz'].sort.each do |file_name|
  puts "Processing #{file_name}"
  
  docs   = []
  errors = []
  Zlib::GzipReader.new(File.new(file_name,'r')).each do |line|
    line.strip!.sub!(/,$/,'')
    begin
      doc = JSON.parse(line)
      docs << {file: file_name, doc: doc.to_json}
    rescue Exception => e
      errors << {file: file_name, line: line}
    end
  end
  
  puts "  #{docs.size} docs"
  puts "  #{errors.size} errors"
  
  DB.transaction do
    DB[:docs].multi_insert(docs)
    DB[:errors].multi_insert(errors)
  end
end