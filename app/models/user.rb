class User < ActiveRecord::Base
  has_many :posts
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "75x75>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
       user.email = "#{auth.uid}@example.net"
       user.password = Devise.friendly_token[0,20]
       user.name = auth.info.name   # assuming the user model has a name
       user.about = auth.info.description
       # user.image = auth.info.image # assuming the user model has an image
     end
   end

   def self.new_with_session(params, session)
     super.tap do |user|
       if data = session["devise.twitter_data"]
         user.email = data["email"] if user.email.blank?
       end
     end
   end
end
