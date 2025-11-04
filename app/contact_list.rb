# frozen_string_literal: true

require 'csv'

require_relative 'contact'

class ContactList
  attr_reader :contacts

  def initialize
    @contacts = []
  end
end
