class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { student: 0, ex_student: 1, operator: 2 }

  def x_profile_link
    "https://x.com/#{x_id}"
  end

  def times_channel_name
    if mattermost_link.present? && mattermost_link.include?("channels")
      mattermost_link.split("/").last
    end
  end
end
