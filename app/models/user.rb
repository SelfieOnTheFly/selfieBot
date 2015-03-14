# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  tw_id       :string
#  tw_handle   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_welcomed :bool
#

class User < ActiveRecord::Base
  include Filterable

  scope :tw_id, -> (tw_id) { where tw_id: tw_id }
  scope :is_welcomed, -> (is_welcomed) { where is_welcomed: is_welcomed }

  def self.allow_filterable_params
    [:tw_id, :is_welcomed]
  end

end
