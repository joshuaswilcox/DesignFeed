class User < ActiveRecord::Base
  rolify
  #attr_accessible :role_ids, :as => :admin
  #attr_accessible :provider, :uid, :name, :email
  validates_presence_of :name
  has_and_belongs_to_many :feed

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end
