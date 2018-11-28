class QuestionnaireSubmissionSerializer < ActiveModel::Serializer
  attributes :id, :digest_key, :status, :credits, :points, :current_team, :team_competition
  attribute :questions

  def questions
    ActiveModelSerializers::SerializableResource.new(object.questionnaire.questions) 
  end

  def credits
    object.questionnaire.credits
  end

  def points
    object.questionnaire.points
  end

  def current_team
    ActiveModelSerializers::SerializableResource.new(object.patient.team) 
  end

  def team_competition
    ActiveModelSerializers::SerializableResource.new(Team.order('points desc').limit(10), each_serializer: TeamSerializer, serializer: ActiveModel::Serializer::CollectionSerializer)
  end
end
