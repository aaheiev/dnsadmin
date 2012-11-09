# == Schema Information
#
# Table name: hosts
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  ip               :string(16)
#  provider_id      :integer          not null
#  location         :string(255)
#  hw_type          :string(255)
#  prod_number      :string(255)
#  billing_number   :string(255)
#  price_per_mon    :decimal(5, 2)    default(0.0)
#  operating_system :string(255)
#  active           :boolean
#  available        :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  hoststate        :string(255)      default("UP")
#

class Host < ActiveRecord::Base
  attr_accessible :name, :location, :active, :available, :hoststate
  attr_accessible :ip, :ipaddress, :provider, :provider_id


  belongs_to :provider

  has_many :host_to_roles
  has_many :host_roles, :through => :host_to_roles

  has_many :ip_addresses
  has_many :app_services, :through => :ip_addresses

  has_many :nagios_statuses, :as => :statusable

  validates :name, presence: true, uniqueness: true
  validates :ip, uniqueness: true
  validates :provider_id, presence: true
  validates :hoststate, :inclusion => { :in => %w(UP DOWN) }
end
