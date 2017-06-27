class CreateSuggestionsJobStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions_job_statuses do |t|
      enable_extension "hstore"
      t.string "message"
      t.hstore "payload"
      t.boolean "done", default: false, null: false
      t.string "jobid"
      t.timestamps
    end
  end
end
