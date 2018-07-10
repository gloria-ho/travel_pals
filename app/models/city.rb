class City < ApplicationRecord
  before_save :downcase_fields
  validates :city, :region, :country, presence: true
  validates_uniqueness_of :city, :scope => [:region, :country], :case_sensitive => false
  # works for city only, region and country are case sensitive
  # validate :unique_city


  has_many :itineraries

  def downcase_fields
    self.city.downcase!
    self.region.downcase!
    self.country.downcase!
  end

  # def unique_city
  #   if City.find_by(city: :city)
  #     validates_uniqueness_of :region, case_sensitive => false
  #     p 'test'
  #   end
  # end
end
