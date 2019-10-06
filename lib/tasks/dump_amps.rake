# frozen_string_literal: true

desc 'dump cisco amps'
task dump_amps: :environment do
  AmpsService.new.dump_amp
end

desc 'dump cisco AMP by connector guid'
task dump_amps_by_guid: :environment do
  AmpsService.new.dump_amps_by_cnctr_guid
end
