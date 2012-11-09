# == Schema Information
#
# Table name: ip_addresses
#
#  ip         :string(16)       not null, primary key
#  host_id    :integer          not null
#  is_primary :boolean          default(FALSE)
#  active     :boolean          default(TRUE)
#

class IpAddress < ActiveRecord::Base
  attr_accessible :ip, :host, :is_primary, :active
  belongs_to :host
  has_many :app_services, :foreign_key => 'ip'
  set_primary_key :ip
end
