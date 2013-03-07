ActiveAdmin.register Project do
  form do |f|
    f.inputs do
      f.input :title
    end
    f.inputs do
      f.input :description
    end
    f.inputs do
      f.input :link
    end
    f.inputs do
      f.input :thumb, :as => :file, :hint => (f.template.image_tag(f.object.thumb) if f.object.thumb.url != "/thumbs/original/missing.png")
    end
    f.inputs do
      f.input :side_project
    end
    f.inputs do
      f.input :created_at, :label => "Date", :as => :just_datetime_picker
    end
    f.buttons
  end
end
