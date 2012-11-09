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

class NagiosStatus < ActiveRecord::Base
  attr_accessible :event_message, :event_status, :event_time, :event_type, :monitor, :monitor_id

  belongs_to :statusable, :polymorphic => true
  belongs_to :monitor, :class_name => 'Host', :foreign_key => :monitor_id

  default_scope order('created_at DESC')
end
