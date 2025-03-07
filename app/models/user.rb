class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { student: 0, ex_student: 1, operator: 2 }

  validates :password, presence: true, on: :create
  validates :username, presence: true
  validates :email, presence: true

  def x_profile_link
    "https://x.com/#{x_id}"
  end

  def times_channel_name
    if mattermost_link.present? && mattermost_link.include?("channels")
      mattermost_link.split("/").last
    end
  end

  def self.role_options
    roles.map { |k, _| [human_attribute_enum_value(:role_i18n, k), k] }.to_h
  end

  def self.human_attribute_enum_value(attr_name, value)
    human_attribute_name("#{attr_name}.#{value}")
  end

  def human_attribute_enum(attr_name)
    self.class.human_attribute_enum_value(attr_name, self[attr_name])
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
