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

# See #PTR

# = Name Server Record (PTR)
#
# Pointer records are the opposite of A and AAAA RRs and are used in Reverse Map
# zone files to map an IP address (IPv4 or IPv6) to a host name.
#
# Obtained from http://www.zytrax.com/books/dns/ch8/ptr.html
#
class PTR < Record

  validates :content, presence: true

end
