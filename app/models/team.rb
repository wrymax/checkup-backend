class Team < ApplicationRecord
  has_many :patients

  # add the points of a questionnaire when a patient submits it
  def add_points_of(questionnaire)
    update(points: points + questionnaire.points)
  end
end
