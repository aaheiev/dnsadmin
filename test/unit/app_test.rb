# == Schema Information
#
# Table name: apps
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  domain_id      :integer
#  app_type       :string(255)
#  access_scope   :string(255)      default("public"), not null
#  ssl_type       :string(255)
#  active         :boolean          default(TRUE)
#  http_auth_user :string(255)
#  http_auth_pass :string(255)
#  comments       :text
#

require 'test_helper'

class AppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
