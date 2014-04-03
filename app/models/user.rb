class User < ActiveRecord::Base
  attr_accessible :address, :name, :nickname, :qq, :status, :tel, :token,:team


  has_many :accounts, as: :owner, dependent: :destroy

  has_many :play_statuses, as: :own, dependent: :destroy

  has_many :vses,as: :own, dependent: :destroy

  has_many :vs_replies,as: :own, dependent: :destroy

  has_many :user_team_rels

  belongs_to :team

end
