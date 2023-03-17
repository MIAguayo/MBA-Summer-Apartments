# == Schema Information
#
# Table name: bookmarks
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  apartment_id :integer
#  user_id      :integer
#
class Bookmark < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :apartment, required: true, class_name: "Apartment", foreign_key: "apartment_id"
end
