# == Schema Information
#
# Table name: domains
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  provider_id      :integer
#  domain_type_id   :integer
#  domain_status_id :integer
#  expiration_date  :date
#  dns_domain_id    :integer
#  master           :string(128)
#  last_check       :integer
#  type             :string(10)       default("NATIVE"), not null
#  notified_serial  :string(255)
#  account          :string(40)
#  comments         :text
#  active           :boolean          default(TRUE)
#  in_dns           :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class DomainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
