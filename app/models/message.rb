class Message
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :subject
  attribute :content

  validates_presence_of :name, :subject, :content, :message => "This field cannot be left blank!"
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i, :message => "This field is in the incorrect format!"
end