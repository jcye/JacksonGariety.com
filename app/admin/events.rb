ActiveAdmin.register Event do
  form do |f|
    f.inputs do
      f.input :title
    end
    f.inputs do
      f.input :event_type, :as => :select, :collection => [["Education",1],["Career",2],["Travel",3],["Living",4],["Interests",5],["Health",6],["Relationships",7],["Birth",8]]
    end
    f.inputs do
      f.input :created_at, :label => "Date", :as => :just_datetime_picker
    end
    f.buttons
  end
end
