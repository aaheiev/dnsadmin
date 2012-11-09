# == Schema Information
#
# Table name: app_services
#
#  id     :integer          not null, primary key
#  name   :string(255)
#  app_id :integer
#  ip     :string(16)
#  prio   :integer          default(0)
#  active :boolean          default(TRUE)
#  status :string(255)      default("UP")
#

require 'test_helper'

class AppServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
