class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :points
end
