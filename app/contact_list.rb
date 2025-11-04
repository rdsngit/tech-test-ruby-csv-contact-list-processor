# frozen_string_literal: true

require 'csv'

require_relative 'contact'

class ContactList
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def load_contacts_from_csv_file(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      contact = Contact.new(
        name: row['name'],
        email: row['email'],
        phone: row['phone']
      )
      @contacts << contact
    end

    @contacts
  end
end
