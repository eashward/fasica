# frozen_string_literal: true

# schedule AMP dumps for every 10 hours
every 10.hours do
  rake 'dump_amps'
end

# schedule AMP dumps by guid for every 5 hours
every 5.hours do
  rake 'dump_amps'
end
