# == Schema Information
#
# Table name: photos
#
#  id           :integer          not null, primary key
#  caption      :string
#  photo_url    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  apartment_id :integer
#
class Photo < ApplicationRecord
end
