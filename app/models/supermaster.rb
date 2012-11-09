# == Schema Information
#
# Table name: supermasters
#
#  id         :integer          not null, primary key
#  ip         :string(16)
#  nameserver :string(255)
#  account    :string(40)
#

class Supermaster < ActiveRecord::Base
  # attr_accessible :title, :body
end
