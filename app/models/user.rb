class User < ActiveRecord::Base
  attr_accessible :address, :name, :nickname, :qq, :status, :tel, :token,:team


  has_many :accounts, as: :owner, dependent: :destroy

  has_many :user_team_rels
  belongs_to :team
  #has_many :teams ,:through => :user_team_rels


  #def my_message
end
