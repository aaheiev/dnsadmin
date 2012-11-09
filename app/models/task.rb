# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  done       :boolean          default(FALSE)
#  name       :string(255)      not null
#  notes      :text
#  priority   :integer          default(0)
#  due        :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :done, :due, :name, :notes, :priority
  validates :name, presence: true
end
