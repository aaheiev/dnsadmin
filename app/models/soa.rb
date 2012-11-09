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

class SOA < Record
  after_find :load_content
  before_save :compose_content

  belongs_to :domain

  SOA_FIELDS = %w{ primary_ns contact serial refresh retry expire minimum }

#  validates :primary_ns, :content, :name, :serial, :refresh, :retry,
#    :expire, :minimum, :presence => true
  validates :serial, :refresh, :retry, :expire, :numericality => {
    :only_integer => true, :allow_blank => true, :greater_than_or_equal_to => 0 }
  validates :minimum, numericality: { allow_blank: true,
    greater_than_or_equal_to: 0, less_than_or_equal_to: 10800 }
  validates :domain_id, presence: true, uniqueness: true
  validates :contact, format: { with: /\A[a-zA-Z0-9\-\.]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,6}\z/ }
#
  private
    def load_content
      @primary_ns, @contact, @serial, @refresh, @retry, @expire, @minimum =
      self[:content].split(/\s+/) unless self[:content].blank?
    end
    def compose_content
      self.content = SOA_FIELDS.map { |f| instance_variable_get("@#{f}").to_s  }.join(' ')
    end
end
