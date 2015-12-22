class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable,  :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,:confirmable,:timeoutable,
		:recoverable, :rememberable, :trackable, :validatable
	
end
