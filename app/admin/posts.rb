ActiveAdmin.register Post do
  before_filter do
    @post = Post.find_by_slug(params[:id])
  end

  form do |f|
    f.inputs do
      f.input :title
    end
    f.inputs do
      f.input :content, :input_html => {:class => "ckeditor"}
    end
    f.inputs do
      f.input :thumb, :as => :file, :hint => (f.template.image_tag(f.object.thumb) if f.object.thumb.url != "/thumbs/original/missing.png")
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
