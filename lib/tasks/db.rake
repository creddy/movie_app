namespace :db do
  desc "Create the dynamodb tables"
  task setup: %i[environment load_models] do
    Dynamoid.included_models.each(&:create_table)
  end

  desc "Drop the dynamodb tables"
  task drop: %i[environment load_models] do
    Dynamoid.included_models.each(&:delete_table)
  end

  task :load_models do
    Rails.application.eager_load!
  end
end
