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

  def save_contacts_to_csv_file(file_path)
    CSV.open(
      file_path,
      'w',
      write_headers: true,
      headers: ['name', 'email', 'clean_phone']
    ) do |csv|
      @contacts.each do |contact|
        next unless contact.valid_email?

        csv << [contact.name, contact.email, contact.clean_phone]
      end
    end

    true
  end
end
