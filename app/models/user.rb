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



end
