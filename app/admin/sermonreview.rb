ActiveAdmin.register Sermonreview do
  permit_params :id, :body, :name, :email, :review_approve => []

  form do |f|
   f.inputs "Sermonreviews" do
     f.input :body
     f.input :review_approve, as: :check_boxes, collection: Sermonreview.approver
     f.input :name
     f.input :email
   end
   f.actions
 end


end
