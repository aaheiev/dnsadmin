# == Schema Information
#
# Table name: providers
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  site_url    :string(255)
#  cp_url      :string(255)
#  cp_username :string(255)
#  cp_password :string(255)
#  email       :string(255)
#  comments    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
