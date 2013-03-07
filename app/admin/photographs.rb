ActiveAdmin.register Photograph do
  before_filter do
    @photograph = Photograph.find_by_slug(params[:id])
  end

  form do |f|
    f.inputs do
      f.input :title
    end
    f.inputs do
      f.input :description
    end
    f.inputs do
      f.input :image_file, :as => :file, :hint => (f.template.image_tag(f.object.image_file) if f.object.image_file.url != "/image_files/original/missing.png")
    end
    f.inputs do
      f.input :created_at, :label => "Date", :as => :just_datetime_picker
    end
    f.inputs do
      f.input :slug
    end
    f.buttons
  end
end
