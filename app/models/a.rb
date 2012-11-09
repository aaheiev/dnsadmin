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

# See #A

# = IPv4 Address Record (A)
#
# Defined in RFC 1035. Forward maps a host name to IPv4 address. The only
# parameter is an IP address in dotted decimal format. The IP address in not
# terminated with a '.' (dot). Valid host name format (a.k.a 'label' in DNS
# jargon). If host name is BLANK (or space) then the last valid name (or label)
# is substituted.
#
# Obtained from http://www.zytrax.com/books/dns/ch8/a.html
#
class A < Record

  # Only accept valid IPv4 addresses
#  VALID_IPV4_ADDRESS = /\A(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/
#  validates :content, format: { with: VALID_IPV4_ADDRESS }
end
