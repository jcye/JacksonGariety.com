ActiveAdmin.register Quote do
  before_filter do
    @quote = Quote.find_by_slug(params[:id])
  end

  form do |f|
    f.inputs do
      f.input :content
    end
    f.inputs do
      f.input :author
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
