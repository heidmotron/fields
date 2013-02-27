# Fields

A parser for nested schema fields like:

    'id,name,friends=(id,name,age,contact(phone,email))'

that turns the data definition into a ruby object like:

    ['id', 'name', {'friends' => ['id', 'name', 'age', {'contact' => ['phone', 'email']}]}]


## Installation

Add this line to your application's Gemfile:

    gem 'fields'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fields

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
