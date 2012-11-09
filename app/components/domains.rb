class Domains < Netzke::Base
  def configuration
    super.merge(
      :items => [{
        :region => :center,
        :class_name => "Netzke::Basepack::GridPanel",
        :model => "Task",
        :title => "Tasks"
      },{
        :region => :east,
        :width => 240,
        :split => true
      },{
        :region => :south,
        :height => 150,
        :split => true
      }]
    )
#    super.merge({
#      :name => "TestPanel",
#      :items => [
#        {:title => "Item One", :class_name => "Basepack::Panel", :region => :center},
#        {:title => "Item Two", :class_name => "Basepack::Panel", :region => :west, :width => 300, :split => true}
#      ]
#    })
  end
end