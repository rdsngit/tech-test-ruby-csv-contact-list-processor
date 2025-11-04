# frozen_string_literal: true

require_relative '../app/contact'

RSpec.describe Contact do
  describe '#initialize' do
    context 'when name, email, and phone data are not present' do
      let(:contact) { described_class.new }

      it 'the name, email, and phone attributes return nil' do
        expect(contact.name).to be_nil
        expect(contact.email).to be_nil
        expect(contact.phone).to be_nil
      end
    end

    context 'when name, email, and phone arguments are present' do
      let(:name) { 'John Doe' }
      let(:email) { 'john@email.com' }
      let(:phone) { '123-456-7890' }
      let(:contact) { described_class.new(name: name, email: email, phone: phone) }

      it 'sets the name, email and phone attributes to the values' do
        expect(contact.name).to eq name
        expect(contact.email).to eq email
        expect(contact.phone).to eq phone
      end
    end
  end
end
