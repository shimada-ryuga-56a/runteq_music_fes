# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { student: 0, ex_student: 1, operator: 2 }

  validates :password, presence: true, on: :create
  validates :username, presence: true
  validates :email, presence: true

  validates :mattermost_link, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_blank: true
  validates :portfolio_link, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_blank: true
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_blank: true

  has_many :artist_members, dependent: :destroy
  has_many :artists, through: :artist_members

  has_many :performer_request_posts, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[username term]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[artist_members artists performer_request_posts]
  end

  def self.ransackable_scopes(_auth_object = nil)
    []
  end

  def self.ransackable_conditions(_auth_object = nil)
    []
  end

  def self.ransackable_methods(_auth_object = nil)
    []
  end

  def x_profile_link
    "https://x.com/#{x_id}"
  end

  def times_channel_name
    return unless mattermost_link.present? && mattermost_link.include?('channels')

    mattermost_link.split('/').last
  end

  def update_with_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update(params, *options)

    clean_up_passwords
    result
  end
end
