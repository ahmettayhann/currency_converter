# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.on(:startup) do

    schedule_file = 'config/cron_schedule.yml'
    if File.exist?(schedule_file)
      Sidekiq::Cron::Job.load_from_hash YAML.safe_load(ERB.new(File.read(schedule_file)).result)
    end
  end
end
