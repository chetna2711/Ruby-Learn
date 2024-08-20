# frozen_string_literal: true

class Student < ApplicationRecord
  before_save :check_state_present
  validates :first_name, :last_name, :city, :state, :country, presence: true
  validates :email, :contact_no, presence: true, uniqueness: true
  validates :contact_no, presence: true, length: { is: 10 }
  validate :validate_country

  def check_state_present
    state = country if state.nil?
  end

  def country_name
    country = IsoCountryCodes.find(self.country)
    country.name
  end

  def validate_country
    return if country.nil?
    unless Student.country_code_list.include?(country)
        errors.add(:country, "is not valid")
    end
  end 

  def self.country_code_list
    IsoCountryCodes.all.map(&:alpha2)
  end
end
