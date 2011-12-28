class Mix < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user, :spotify_url, :message, :public, :password, :name, :created_at, :recipient_name, :recipient_email, :user_id
end

# == Schema Information
#
# Table name: mixes
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  spotify_url     :string(255)
#  message         :text
#  public          :boolean
#  password        :string(255)
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  recipient_name  :string(255)
#  recipient_email :string(255)
#

