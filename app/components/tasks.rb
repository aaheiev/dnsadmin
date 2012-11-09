class Tasks < Netzke::Basepack::GridPanel
  def configuration
    super.merge({
      :model => "Task",
      :columns => [
        :done,
        :name,
        {name: :notes, flex: 1},
        :priority,
        {name: :due, header: "Due on"}
      ],
#      :bbar => nil,
      :tbar => [{
        :menu => [:add.action, :edit.action, :apply.action, :del.action],
        :text => "Edit inline",
        :icon =>"/images/icons/table.png"
      },{
        :menu => [:add_in_form.action, :edit_in_form.action],
        :text => "Edit in form",
        :icon => "/images/icons/application_form.png"
      }]
    })
  end

end
