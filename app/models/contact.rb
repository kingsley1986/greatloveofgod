class Contact < MailForm::Base

  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, :validate => true
  attribute :nickname, :captcha => true


  def headers
    {
    :subject => "Prayer Request",
    :to => "great_love_of_god@yahoo.co.uk",
    :from => %("#{name}" <#{email}> )
    }
  end
end
