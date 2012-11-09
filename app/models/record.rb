# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  domain_id   :integer          not null
#  name        :string(255)
#  type        :string(10)
#  content     :text
#  ttl         :integer
#  prio        :integer
#  change_date :integer
#  ordername   :string(255)
#  auth        :boolean
#
#@@record_types = ['A', 'AAAA', 'CNAME', 'LOC', 'MX', 'NS', 'PTR', 'SOA', 'SPF', 'SRV', 'TXT']

class Record < ActiveRecord::Base
   attr_accessible :domain_id, :name, :type, :content, :ttl, :prio
   attr_accessor :primary_ns, :contact, :serial, :refresh, :retry, :expire, :minimum

   belongs_to :domain
   validates :name, presence: true
   validates :domain_id, presence: true
end
