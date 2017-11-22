First to-do list
1.  DONE Create classes - CLI, scraper, gardening
2.  DONE Scraper - Access the info for the list of vegetables & herbs
3.  DONE (but needs more attention) Scraper - Access each individual vegetable and herbs
4.  DONE (but check that this is working properly) Gardening - Creates instances of each vegetable and put into an @@all array
5.  DONE bin/console or other - Executable file, Create
6.  DONE Executable file - require/environment file
7.  DONE Executable file - calls a new instance of CLI class and runs through start or like method
8.  DONE CLI - Create a welcome and menu

Second to-do list
**Screen record**
**Commit and commit often**
1. DONE CLI - utilize user input to print all vegetables or vegetables by letter
2. DONE CLI - utilize user input to print an individual vegetable
3. DONE CLI - ask user if they would like to see another vegetable, repeat loop
4. DONE Scraper - fix vegetable url scraping
5. DONE Scraper - edit vegetables that are found under a sub-list
6. DONE Vegetable - Test each vegetable to make sure information is coming in correctly
7. DONE CLI - Add protection to inputs so that program doesn't error out or exit unexpectedly

Third to-do list
1. Watch videos and refactor
2. Write out instructions of how a user will use
3. Edit readme to reflect how the user will use
4. spec.md, check off items
5. Video Demo
6. Blog post


# Gardening

Welcome to the Gardening gem.  This gem will provide you with instructions and information on growing a variety of vegetables at your own home.  All vegetables listings will provide an overview of the plant, recommended varieties, cold tolerance, required sun, germination soil temperature or planting recommendations, the amount of time until harvest, and additional information on the plant.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gardening'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gardening

## Usage

To use this gem, run `ruby gardening/bin/gardening`. A menu will appear with instructions on selecting a vegetable to read more information on.  Once you have read the information, you will then be able to select whether you'd like to see more information on another vegetable or exit the program. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'ackerm44'/gardening. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Gardening project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'ackerm44'/gardening/blob/master/CODE_OF_CONDUCT.md).
