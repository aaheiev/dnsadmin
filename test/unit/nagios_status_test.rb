# == Schema Information
#
# Table name: nagios_statuses
#
#  id              :integer          not null, primary key
#  statusable_id   :integer
#  statusable_type :string(255)
#  monitor_id      :integer
#  event_type      :string(255)
#  event_status    :string(255)
#  event_message   :string(255)
#  event_time      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class NagiosStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
