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
  belongs_to :owner, required: true, class_name: "User", foreign_key: "owner_id"

  has_many  :photos, class_name: "Photo", foreign_key: "apartment_id", dependent: :destroy

  has_many  :bookmarks, class_name: "Bookmark", foreign_key: "apartment_id", dependent: :destroy
  
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"

end
