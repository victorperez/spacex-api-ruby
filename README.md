# Spacex API

Ruby API wrapper to consume the [SpaceX API](https://github.com/r-spacex/SpaceX-API).

The gem currently support the latest SpaceX API version (V4).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spacex_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install spacex_api

## Usage

### Capsules

Detailed info for serialized dragon capsules

* Get all capsules: `SpacexApi.client.capsules`
* Get one capsule: `SpacexApi.client.get_capsule('id')`
* Query capsules: `SpacexApi.client.query_capsules({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.capsules.first[:id]
  => "5e9e2c5bf35918ed873b2664"
```

### Company Info

Detailed info about SpaceX as a company

* Get company info: `SpacexApi.client.company_info`

```ruby
client = SpacexApi.client
client.company_info[:headquarters]
  => {:address=>"Rocket Road", :city=>"Hawthorne", :state=>"California"}
```

### Cores

Detailed info for serialized first stage cores

* Get all cores: `SpacexApi.client.cores`
* Get one core: `SpacexApi.client.get_core('id')`
* Query cores: `SpacexApi.client.query_cores({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.cores.first[:id]
  => "5e9e289df35918033d3b2623"
```

### Crew

Detailed info on dragon crew members

* Get all crew members: `SpacexApi.client.crews`
* Get one crew member: `SpacexApi.client.get_crew('id')`
* Query crew members: `SpacexApi.client.query_crews({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.crews.first[:id]
  => "5ebf1a6e23a9a60006e03a7a"
```

### Dragons

Detailed info on dragon crew members

* Get all dragons: `SpacexApi.client.dragons`
* Get one dragon: `SpacexApi.client.get_dragon('id')`
* Query dragons: `SpacexApi.client.query_dragons({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.dragons.first[:id]
  => "5e9d058759b1ff74a7ad5f8f"
```

### Historical events

Detailed info on SpaceX historical events

* Get all historical events: `SpacexApi.client.historical_events`
* Get one historical event: `SpacexApi.client.get_historical_event('id')`
* Query historical events: `SpacexApi.client.query_historical_events({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.historical_events.first[:id]
  => "5f6fb2cfdcfdf403df37971e"
```

### Landpads

Detailed info about landing pads and ships

* Get all landpads: `SpacexApi.client.landpads`
* Get one landpad: `SpacexApi.client.get_landpad('id')`
* Query landpads: `SpacexApi.client.query_landpads({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.landpads.first[:id]
  => "5e9e3032383ecb267a34e7c7"
```

### Launches

Detailed info about launches

* Get past launches: `SpacexApi.client.past_launches`
* Get upcoming launches: `SpacexApi.client.upcoming_launches`
* Get latest launch: `SpacexApi.client.latest_launch`
* Get next launch: `SpacexApi.client.next_launch`
* Get all launches: `SpacexApi.client.launches`
* Get one launch: `SpacexApi.client.get_launch('id')`
* Query launches: `SpacexApi.client.query_launches({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.launches.first[:id]
  => "5eb87cd9ffd86e000604b32a"
```

### Launchpads

Detailed info about launchpads

* Get all launchpads: `SpacexApi.client.launchpads`
* Get one launchpad: `SpacexApi.client.get_launchpad('id')`
* Query launchpads: `SpacexApi.client.query_launchpads({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.launchpads.first[:id]
  => "5e9e4501f5090910d4566f83"
```

### Payloads

Detailed info about launch payloads

* Get all payloads: `SpacexApi.client.payloads`
* Get one payload: `SpacexApi.client.get_payload('id')`
* Query payloads: `SpacexApi.client.query_payloads({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.payloads.first[:id]
  => "5eb0e4b5b6c3bb0006eeb1e1"
```

### Roadster info

Detailed info about Elon's Tesla roadster's current position

* Get roadster info: `SpacexApi.client.roadster`
* Query roadster info: `SpacexApi.client.query_roadster({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.roadster[:id]
  => "5eb75f0842fea42237d7f3f4"
```

### Rockets

Detailed info about rocket versions

* Get all rockets: `SpacexApi.client.rockets`
* Get one rocket: `SpacexApi.client.get_rocket('id')`
* Query rockets: `SpacexApi.client.query_rockets({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.rockets.first[:id]
  => "5e9d0d95eda69955f709d1eb"
```

### Ships

Detailed info about ships in the SpaceX fleet

* Get all ships: `SpacexApi.client.ships`
* Get one ship: `SpacexApi.client.get_ship('id')`
* Query ships: `SpacexApi.client.query_ships({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.ships.first[:id]
  => "5ea6ed2d080df4000697c901"
```

### Starlink

Detailed info about Starlink satellites and orbits. Includes raw orbit data from [Space Track](https://www.space-track.org/auth/login), updated hourly.

* Get all Starlink sats: `SpacexApi.client.starlinks`
* Get one Starlink sat: `SpacexApi.client.get_starlink('id')`
* Query Starlink sats: `SpacexApi.client.query_starlinks({}.to_json)`
  * See [query](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/queries.md) guide for more details on building queries and paginating

```ruby
client = SpacexApi.client
client.starlinks.first[:id]
  => "5eed770f096e59000698560d"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/victorperez/spacex-api-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/victorperez/spacex-api-ruby/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SpacexApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/victorperez/spacex-api-ruby/blob/master/CODE_OF_CONDUCT.md).
