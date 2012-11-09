# == Schema Information
#
# Table name: host_to_roles
#
#  host_id      :integer          not null
#  host_role_id :integer          not null
#

class HostToRole < ActiveRecord::Base
  attr_accessible :host, :host_role
  belongs_to :host
  belongs_to :host_role
end
