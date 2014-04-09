#encoding:utf-8
class User < ActiveRecord::Base
  attr_accessible :address, :name, :nickname, :qq, :status, :tel, :token, :team
  include UserToken
  include StatusCode


  has_many :accounts, as: :owner, dependent: :destroy

  has_many :play_statuses, as: :own, dependent: :destroy

  #has_many :vses, as: :own, dependent: :destroy

  #has_many :vs_replies, as: :own, dependent: :destroy

  has_many :user_team_rels

  belongs_to :team
  has_many :appointments

  before_create :init_user_token

  class << self
    def login_user(account_name, password)
      account = Account.where('name = ?', account_name).first

      if account && account.authenticate(password)
        user ||= account.owner
      end
      user
    end

    def is_mobile(mobile)
      mobile.to_s =~ /^\d{11}$/
    end

    def create_user(account_name, password, password_confirmation)
      raise AccountActionException, '两次输入的密码不一致' if password != password_confirmation
      raise AccountActionException, '用户名已经被注册' unless Account.select('id').where('name = ?', account_name).first.nil?
      user = nil
      User.transaction do
        begin
          user ||= User.new
          user.save!
          account = user.accounts.build
          account.name = account_name
          account.password = password
          account.save!

        rescue ActiveRecord::StaleObjectError => e
          logger.error("can not create user due to #{e.message}")
          raise AccountActionException, '注册失败，请重试'
        end
      end
      return user
    end

  end


end
