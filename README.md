# YearArray

[![Build Status](https://travis-ci.com/iwan/year_array.svg?branch=master)](https://travis-ci.com/iwan/year_array)
[![Coverage Status](https://coveralls.io/repos/github/iwan/year_array/badge.svg?branch=master)](https://coveralls.io/github/iwan/year_array?branch=master)


It's basically an array wrapper used to play (do some check and calculation) with 8760 (or 8784) hourly values related to a year.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'year_array'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install year_array

## Usage

### Initialize

```ruby
arr = Yarray.new(2018)
arr.to_s   => "start_time: 2018-01-01 00:00:00 +0100, arr: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, ..., 0.0]"
```
will initialize the array to zero.

Otherwise pass the init value:
```ruby
arr = Yarray.new(2018, value: 1.0)
arr.to_s   => "start_time: 2018-01-01 00:00:00 +0100, arr: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, ..., 0.0]"
```
You can also pass an init array:
```ruby
arr = Yarray.new(2018, arr: [0.0, 1.0, 2, 3])
arr.to_s   => "start_time: 2018-01-01 00:00:00 +0100, arr: [0.0, 1.0, 2.0, 3.0, 0.0, 0.0, 0.0, ..., 0.0]"
```
The array will be truncated or filled with zero values in order to reach the correct number of hours in year.

### Functions
```ruby
ya1 = Yarray.new(2018, value: 1.0)
ya2 = Yarray.new(2018, value: 2.0)

ya1.size   # => 8760
ya1.year   # => 2018

# Operations on each element of array

# The result will be stored in a new yarray object (more memory expensive):
ya1 + ya2
ya1 - ya2
ya1 * ya2
ya1 / ya2

# The operation will be computed in the caller ya1:
ya1.add(ya2)
ya1.subtract(ya2)
ya1.multiply(ya2)
ya1.divide(ya2)


Yarray.min(ya1, ya2)   # return a Yarray object where each value is the minimum between value of ya1 and ya2
Yarray.max(ya1, ya2)   # return a Yarray object where each value is the maximum between value of ya1 and ya2

ya1.any_positive?
ya1.any_negative?

ya1.any do |v|
  v > 100
end

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/year_array. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the YearArray project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/year_array/blob/master/CODE_OF_CONDUCT.md).
