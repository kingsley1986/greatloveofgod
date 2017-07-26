ActiveAdmin.register Page do
  permit_params :body, :page_type, pictures_attributes: [:id, :image, :_destroy ]

  form do |f|
    f.inputs "Page Details" do
       f.input :body, as: :text
       f.select :page_type, Page::PAGE_TYPE
       f.has_many :pictures do |ff|
         ff.input :image, multiple: true, name: "pictures[image][]", :as => :file, :hint => ff.template.image_tag(ff.object.image.url(:medium))
       end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :body
      row :page_type
    end
      table_for page.pictures do
        column :image do |a|
         image_tag a.image.url
       end
    end
  end

end
