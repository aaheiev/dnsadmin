# == Schema Information
#
# Table name: ip_addresses
#
#  ip         :string(16)       not null, primary key
#  host_id    :integer          not null
#  is_primary :boolean          default(FALSE)
#  active     :boolean          default(TRUE)
#

require 'test_helper'

class IpAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
