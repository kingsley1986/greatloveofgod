ActiveAdmin.register UpcomingEvent do
  permit_params :title, :body, :starting_date, :going, :coming_with, :end_date, pictures_attributes: [:id, :image, :_destroy ]

  form do |f|
   f.inputs "Post Details" do
     f.input :title
     f.input :body, as: :text
     f.input :starting_date, as: :datetime_picker
     f.input :end_date, as: :datetime_picker
     f.input :going, as: :array
     f.input :coming_with, as: :array
     f.has_many :pictures do |ff|
       ff.input :image, :as => :file, :hint => ff.template.image_tag(ff.object.image.url(:medium))
     end
   end
   f.actions
 end

 show do
   attributes_table do
     row :title
     row :body
     row :going
     row :coming_with
     row :starting_date
     row :end_date
   end
    table_for upcoming_event.pictures do
      column :image do |a|
        image_tag a.image.url
      end
    end
  end
end
