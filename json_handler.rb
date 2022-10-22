require_relative './book'
require_relative './label'
require_relative './item'
require 'json'

class JsonHandler
  DATA_DIRECTORY = './data_json/'.freeze

  def self.read_books(books)
    path = "#{DATA_DIRECTORY}books.json"
    return unless File.exist?(path)

    books_file = File.open(path)
    JSON.parse(books_file.read).each do |book|
      books << Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['title'], book['color'])
    end
  end

  def self.write_books(books)
    return if books.empty?

    path_file = "#{DATA_DIRECTORY}books.json"
    data_books = books.each_with_index do |book, index|
       "#{index + 1} publish_date: #{book.publish_date} publisher: #{book.publisher} cover_state: #{book.cover_state}" 
    end
    File.write(path_file, JSON.pretty_generate(data_books))
  end

  def self.read_labels(labels)
    return labels unless File.exist?('./data_json/labels.json')
    # path = "#{DATA_DIRECTORY}labels.json"
    # return unless File.exist?(path)

    labels_file = File.open('./data_json/labels.json')
    JSON.parse(labels_file.read).each do |label|
      labels << Label.new(label['title'], label['color'])
    end
  end

  def self.write_labels(labels)
    # return if labels.empty?
    labels_array = []
    # path_file = "#{DATA_DIRECTORY}labels.json"
    labels.each do |label|
      labels_array << { title: label.title, color: label.color }
    end
    File.write('./data_json/labels.json', JSON.pretty_generate(labels_array))
  end
end
