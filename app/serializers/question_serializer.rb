class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :question_type, :options
end
