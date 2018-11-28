class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :questionnaire_submission

  # the details considering question type
  def answer_details
    q_type = question.question_type
    if q_type == 'scale'
      question.options[value.to_i]
    elsif q_type == 'multiple_choice'
      question.options[value.to_i]
    elsif q_type == 'boolean'
      question.options[value.to_i]
    else
      value
    end
  end
end
