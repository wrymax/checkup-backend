class AddLastSentAtToQuestionnaire < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaires, :last_sent_at, :datetime
  end
end
