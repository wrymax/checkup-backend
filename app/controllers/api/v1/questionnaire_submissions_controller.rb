module Api::V1
  class QuestionnaireSubmissionsController < ApiController
    # skip_before_action :authenticate_user!, only: [:show, :submit]
    before_action :find_questionnaire_submission, only: [:show, :submit]

    # GET /questionnaire_submissions/:digest_key
    # return the questionnaire
    def show
      if @questionnaire_submission.submitted?
        render json: {
          questionnaire_submission: {
            status: @questionnaire_submission.status
          }
        }
      else
        render json: {
          questionnaire_submission: ActiveModelSerializers::SerializableResource.new(@questionnaire_submission)
        }
      end
    end

    # POST /questionnaire_submissions/:digest_key/submit
    def submit
      if @questionnaire_submission.submit!(questionnaire_submission_params)
        render json: {
          questionnaire_submission: ActiveModelSerializers::SerializableResource.new(@questionnaire_submission)
        }
      else
        render json: {
          error_code: 50001, 
          message: @questionnaire_submission.errors.full_messages
        }
      end
    end

    private

    def find_questionnaire_submission
      @questionnaire_submission = QuestionnaireSubmission.find_by_digest_key(params[:digest_key])
    end

    def questionnaire_submission_params
      params.require(:questionnaire_submission).permit(answers: [:value, :question_id])
    end
  end
end
