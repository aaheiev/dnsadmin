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

class AppService < ActiveRecord::Base
  attr_accessible :ip, :active, :name, :prio, :status

  belongs_to :app
  belongs_to :ip_address, :class_name => 'IpAddress', :foreign_key => 'ip'

  #  belongs_to :host, :through => :ip_address

  has_many :nagios_statuses, :as => :statusable

  validates :app_id, presence: true

  validates :prio, :numericality => {
    :only_integer => true, :allow_blank => true, :greater_than_or_equal_to => 0 }
  validates :status, :inclusion => { :in => %w(UP DOWN) }
end
