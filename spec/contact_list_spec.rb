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
end
