# frozen_string_literal: true

require_relative '../app/contact_list'

RSpec.describe ContactList do
  let(:contact_list) { described_class.new }

  let(:input_csv_file_path) { 'spec/fixtures/input.csv' }
  let(:expected_output_csv_file_path) { 'spec/fixtures/input.csv' }
end
