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

# See #CNAME

# = Canonical Name Record (CNAME)
#
# A CNAME record maps an alias or nickname to the real or Canonical name which
# may lie outside the current zone. Canonical means expected or real name.
#
# Obtained from http://www.zytrax.com/books/dns/ch8/cname.html
#
class CNAME < Record
  validates :content, presence: true
end
