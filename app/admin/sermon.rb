ActiveAdmin.register Sermon do
  permit_params :title, :body, :preacher, :sermondate, pictures_attributes: [:id, :image, :_destroy ]

  form do |f|
    f.inputs "Sermons Details" do
       f.input :title
       f.input :body, as: :text
       f.input :preacher
       f.input :sermondate, as: :date_picker
       f.has_many :pictures do |ff|
         ff.input :image, multiple: true, name: "pictures[image][]", :as => :file, :hint => ff.template.image_tag(ff.object.image.url(:medium))
       end
    end
    f.actions
  end
end
