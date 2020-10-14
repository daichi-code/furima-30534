class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items


  validates :nickname, presence: true
  validates :birthday, presence: true


  devise :validatable, password_length: 6..128
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name1
    validates :last_name1
  end

  with_options presence: true, format: { with: /\A^([ァ-ン]|ー)+$\z/ } do
    validates :first_name2
    validates :last_name2
  end
end
