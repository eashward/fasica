# frozen_string_literal: true

desc 'dump cisco amps'
task dump_amps: :environment do
  AmpsService.new.dump_amp
end
