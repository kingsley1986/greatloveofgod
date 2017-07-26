ActiveAdmin.register Comment, as: 'PostComment' do
  permit_params :id, :body, :approved => [], pictures_attributes: [:id, :image, :_destroy ]

   controller do
     defaults resource_class: Comment, collection_name: 'comments', instance_name: 'comment'
   end


   form do |f|
    f.inputs "Post Details" do
      f.input :body
      f.input :approved, as: :check_boxes, collection: Comment.approver
      f.has_many :pictures do |ff|
        ff.input :image, :as => :file, :hint => ff.template.image_tag(ff.object.image.url(:medium))
      end
    end
    f.actions
  end
end
