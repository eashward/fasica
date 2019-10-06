# README
* rake task and schedulers
* dump_amps -> Makes live call to Cisco API v1/computers and dumps data to amps table
* dump_amps_by_guid -> Makes live call to Cisco API v1/computers/:connector_guid and dumps data to amps table
* Services (job queues, cache servers, search engines, etc.)
* Scheduler runs rake task `dump_amps` every 10 hours.
* Scheduler runs rake task `dump_amps_by_guid` every 10 hours.


* spin up rails server and add admin user
* `client_id` and `key` should be inserted manually via `rails c` to access API
* `client_id` and `key` will be encrypted before commiting to db.
