# frozen_string_literal: true

class Student < ApplicationRecord

  has_many :student_skills, dependent: :destroy
  has_many :skills, through: :student_skills 

  has_many :student_courses, dependent: :destroy
  has_many :courses, through: :student_courses
  
  validates :first_name, :last_name, :city, :country, presence: true
  validates :email, presence: true, uniqueness: true
  validates :contact_no, presence: true, length: { is: 10 }
  validate :validate_country

  before_save :check_state_present

  def check_state_present
    self.state = country if state.nil?
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

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
