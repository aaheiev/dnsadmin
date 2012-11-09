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

# See #LOC

# = Name Server Record (LOC)
#
# In the Domain Name System, a LOC record (RFC 1876) is a means for expressing
# geographic location information for a domain name.
# It contains WGS84 Latitude, Longitude and Altitude information together with
# host/subnet physical size and location accuracy. This information can be
# queried by other computers connected to the Internet.
#
# Obtained from http://en.wikipedia.org/wiki/LOC_record
#
class LOC < Record

  validates :content, presence: true

end
