require 'spec_helper'

describe Person do
  it { should have_many (:projects) }
  it { should have_many (:stories) }
  it { should have_many (:messages) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }


  # TODO
  # it { should validate_uniqueness_of :name }
  #   it { should validate_uniqueness_of :email }
end

# == Schema Information
#
# Table name: people
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)
