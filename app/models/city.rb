# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  city_name  :string
#  city_state :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class City < ApplicationRecord

  has_many(:apartments, {
    :foreign_key => "city_id"
  })
  

end
