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

class Domain < ActiveRecord::Base
  attr_accessible :name, :provider_id, :domain_type_id, :domain_status_id,
    :dns_domain_id, :comments, :active, :in_dns, :type
  belongs_to :provider
  belongs_to :domain_type

  belongs_to :domain_status
  belongs_to :dns_domain, :class_name => 'Domain'

  has_many :hosted_domains, :class_name => 'Domain', :foreign_key => 'dns_domain_id'

  has_many :apps

  has_many :records, dependent: :destroy

  has_one  :soa_record,    :class_name => 'SOA'
  has_many :ns_records,    :class_name => 'NS'
  has_many :mx_records,    :class_name => 'MX'
  has_many :a_records,     :class_name => 'A'
  has_many :txt_records,   :class_name => 'TXT'
  has_many :cname_records, :class_name => 'CNAME'
  has_one  :loc_record,    :class_name => 'LOC'
  has_many :aaaa_records,  :class_name => 'AAAA'
  has_many :spf_records,   :class_name => 'SPF'
  has_many :srv_records,   :class_name => 'SRV'
  has_many :ptr_records,   :class_name => 'PTR'

  validates :name, presence: true, uniqueness: true
  validates :type, :inclusion => { :in => %w(NATIVE MASTER SLAVE),
    :message => "must be one of NATIVE, MASTER, or SLAVE" }, :allow_nil => true

  set_inheritance_column 'not_used_here'

end

#class NATIVE < Domain
#end
#
#class MASTER < Domain
#end
#
#class SLAVE < Domain
#end
