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
#  firstname   :string
#  name        :string
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
