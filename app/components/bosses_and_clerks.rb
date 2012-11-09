class BossesAndClerks < Netzke::Basepack::BorderLayoutPanel
  def configuration
    super.merge(
      :items => [{
        :region => :center
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
  end
end
