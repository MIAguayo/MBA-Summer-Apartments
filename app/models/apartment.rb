# == Schema Information
#
# Table name: apartments
#
#  id                 :integer          not null, primary key
#  address            :string
#  bathrooms          :integer
#  bedrooms           :integer
#  city_name          :string
#  description        :text
#  from_date          :date
#  owner_email        :string
#  owner_name         :string
#  pet_friendly       :boolean
#  price              :integer
#  to_date            :date
#  utilities_included :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  city_id            :integer
#  owner_id           :integer
#
class Apartment < ApplicationRecord
  belongs_to(:city)

  has_many(:apartment_photos, {
    :foreign_key => "apartment_id"
  })

end
