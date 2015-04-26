ActiveAdmin.register Post do
  permit_params :author, :title, :content, :category_ids => []

  index do
    selectable_column
    id_column
    column :author
    column :title
    column :content
    column :categories do |post|
      post.categories.pluck(:name).join(', ')
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :author
      row :title
      row :content
      row :categories do
        post.categories.pluck(:name).join(', ')
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Post Details" do
      f.input :author
      f.input :title
      f.input :content
      f.input :categories, as: :check_boxes
    end
    f.actions
  end
end
