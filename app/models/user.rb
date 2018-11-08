class User < ApplicationRecord
  has_secure_password

  # Find profile of a user
  def profile
    eval(profile_type).find(profile_id)
  end

  def create_profile(type, params={})
    _profile = eval(type).create(params.merge(user_id: id))
    update(profile_type: type, profile_id: _profile.id)
    _profile
  end
end
