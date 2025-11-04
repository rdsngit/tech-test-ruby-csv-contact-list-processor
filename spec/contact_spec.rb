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

  describe '#valid_email?' do
    context 'when email is nil' do
      let(:contact) { described_class.new(email: nil) }

      it 'returns false' do
        expect(contact.valid_email?).to be false
      end
    end

    context 'when email contains @ but not .' do
      let(:contact) { described_class.new(email: 'john@emailcom') }

      it 'returns false' do
        expect(contact.valid_email?).to be false
      end
    end

    context 'when email contains . but not @' do
      let(:contact) { described_class.new(email: 'johnemail.com') }

      it 'returns false' do
        expect(contact.valid_email?).to be false
      end
    end

    context 'when email contains both . and @' do
      let(:contact) { described_class.new(email: 'john@email.com') }

      it 'returns true' do
        expect(contact.valid_email?).to be true
      end
    end
  end

  describe '#clean_phone' do
    context 'when phone is nil' do
      let(:contact) { described_class.new(phone: nil) }

      it 'returns nil' do
        expect(contact.clean_phone).to eq nil
      end
    end

    context 'when phone contains a mix of numbers and non-digit characters' do
      let(:contact) { described_class.new(phone: '123-456-7890') }

      it 'returns only the number characters' do
        expect(contact.clean_phone).to eq '1234567890'
      end
    end
  end
end
