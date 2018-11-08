class QuestionnaireSubmissionSerializer < ActiveModel::Serializer
  attributes :id, :digest_key, :status
  attribute :questions

  def questions
    ActiveModelSerializers::SerializableResource.new(object.questionnaire.questions) 
  end
end
