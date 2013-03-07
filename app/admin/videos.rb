ActiveAdmin.register Video do
  form do |f|
    f.inputs do
      f.input :title
    end
    f.inputs do
      f.input :vimeo
    end
    f.inputs do
      f.input :created_at, :label => "Date", :as => :just_datetime_picker
    end
    f.buttons
  end
end
