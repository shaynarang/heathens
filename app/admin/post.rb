ActiveAdmin.register Post do
  permit_params :author, :title, :content
end
