# frozen_string_literal: true

class Contact
  attr_reader :name, :email, :phone

  def initialize(name: nil, email: nil, phone: nil)
    @name = name
    @email = email
    @phone = phone
  end

  def valid_email?
    return false if @email.nil?

    @email.include?('@') && @email.include?('.')
  end
end
