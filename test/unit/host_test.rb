# == Schema Information
#
# Table name: hosts
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  ip               :string(16)
#  provider_id      :integer          not null
#  location         :string(255)
#  hw_type          :string(255)
#  prod_number      :string(255)
#  billing_number   :string(255)
#  price_per_mon    :decimal(5, 2)    default(0.0)
#  operating_system :string(255)
#  active           :boolean
#  available        :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  hoststate        :string(255)      default("UP")
#

require 'test_helper'

class HostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
