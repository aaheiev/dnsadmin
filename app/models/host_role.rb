# == Schema Information
#
# Table name: host_roles
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :string(255)
#

class HostRole < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :host_to_roles
  has_many :hosts, :through => :host_to_roles
end
