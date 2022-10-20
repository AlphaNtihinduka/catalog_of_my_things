require_relative './book'
require_relative './label'
require_relative './item'
require 'json'

class JsonHandler
  DATA_DIRECTORY = './data_json/'.freeze

  # def self.read_books(books)
  #   path = "#{DATA_DIRECTORY}books.json"
  #   return unless File.exist?(path)

  #   books_file = File.open(path)
  #   JSON.parse(books_file.read).each do |book|
  #     books << Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['label'])
  #   end
  # end

  # def self.write_books(books)
  #   return if books.empty?

  #   path_file = "#{DATA_DIRECTORY}books.json"
  #   data_books = books.map do |book|
  #     { publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state }
  #   end
  #   File.write(path_file, JSON.pretty_generate(data_books))
  # end

  #   def self.read_labels(labels)
  #     path = "#{DATA_DIRECTORY}labels.json"
  #     return unless File.exist?(path)

  #     labels_file = File.open(path)
  #     JSON.parse(labels_file.read).each do |label|
  #       labels << Label.new(label['title'], label['color'])
  #     end
  #   end

  #   def self.write_labels(labels)
  #     return if labels.empty?

  #     path_file = "#{DATA_DIRECTORY}labels.json"
  #     data_labels = labels.map do |label|
  #       { title: label.title, color: label.color }
  #     end
  #     File.write(path_file, JSON.pretty_generate(data_labels))
  #   end
end
