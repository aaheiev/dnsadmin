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

# See #SRV

# = Service Record (SRV)
#
# An SRV record or Service record is a category of data in the Internet Domain
# Name System specifying information on available services. It is defined in
# RFC 2782. Newer internet protocols such as SIP and XMPP often require SRV
# support from clients.
#
# Obtained from http://en.wikipedia.org/wiki/SRV_record
#
# See also http://www.zytrax.com/books/dns/ch8/srv.html
#
class SRV < Record

  validates :prio, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :content, presence: true

  # We support priorities
  def supports_prio?
    true
  end
end
