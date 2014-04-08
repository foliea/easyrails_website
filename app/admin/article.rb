ActiveAdmin.register Article do

  form do |f|
    f.inputs "Article details" do
      f.input :user, as: :select, include_blank: false, collection: User.all, label_method: :email
      f.input :locale, as: :select, include_blank: false, collection: Language.pluck(:locale)
      f.input :title
      f.input :body
    end

    f.actions
  end

  permit_params :title, :body, :user_id, :locale
end
