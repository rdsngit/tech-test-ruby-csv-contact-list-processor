# frozen_string_literal: true

require_relative '../app/contact_list'

RSpec.describe ContactList do
  let(:contact_list) { described_class.new }

  let(:input_csv_file_path) { 'spec/fixtures/input.csv' }
  let(:expected_output_csv_file_path) { 'spec/fixtures/input.csv' }

  describe '#initialize' do
    it 'sets the contacts instance variable to an empty array' do
      expect(contact_list.contacts).to eq []
    end
  end

  describe '#load_contacts_from_csv_file' do
    it 'reads the input CSV file and for each row adds an instance of Contact with the name, email and phone data to the contacts array' do
      contact_list.load_contacts_from_csv_file(input_csv_file_path)
      expect(contact_list.contacts).to match_array([
        have_attributes(class: Contact, name: 'John Doe', email: 'john@email.com', phone: '123-456-7890'),
        have_attributes(class: Contact, name: 'Jane Smith', email: 'jane@email.com', phone: nil),
        have_attributes(class: Contact, name: 'Bob Johnson', email: 'bob@invalid-email', phone: '555.123.4567'),
        have_attributes(class: Contact, name: 'Mary Davis', email: 'mary@email.com', phone: '1234567890')
      ])
    end
  end
end
