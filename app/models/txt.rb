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

# See #TXT

# = Text Record (TXT)
# Provides the ability to associate some text with a host or other name. The TXT
# record is used to define the Sender Policy Framework (SPF) information record
# which may be used to validate legitimate email sources from a domain. The SPF
# record while being increasing deployed is not (July 2004) a formal IETF RFC
# standard.
#
# Obtained from http://www.zytrax.com/books/dns/ch8/txt.html
class TXT < Record

  validates :content, presence: true

end
