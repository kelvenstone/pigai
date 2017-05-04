class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\Z/i
  validates :email, presence:{ message:"请输入邮箱的正确格式" }
  validates :password, presence:true,length: { minimum: 6, maxlength: 10, message:'密码长度6～11位数'}
  validates :password_confirmation, presence: true, length: { minimum: 6, maxlength: 10, message:'密码长度6～11位数'  }
  validates :name, presence: true
  validates :school, presence: true
  validates :qq_number, presence: true, length: { minimum: 5, maxlength: 11, message:'qq长度5～11位数' }
  validates :phone_number, presence: true, length: { is: 11, message:'手机号长度11位'}


  has_many :compositions
  has_many :writings
  has_many :corrections

  def admin?
    is_admin
  end

end
