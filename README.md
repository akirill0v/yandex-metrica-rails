# Yandex::Metrika::Rails
[![Coverage
Status](https://coveralls.io/repos/saratovsource/yandex-metrika-rails/badge.png?branch=master)](https://coveralls.io/r/saratovsource/yandex-metrika-rails)

Yandex Metrika gem for Rails 3.x. It based on [google-analytics-rails]: https://github.com/bgarret/google-analytics-rails gem.

## Installation

Add this line to your application's Gemfile:

    gem 'yandex-metrika-rails'

And then execute:

    $ bundle

## Usage

`config/environments/<environment>.rb`

    YM.counter = "" # You shoul insert you Yandex Metrica code

You must leave this field blank if you do not want to display the metric
on the page for that environment.
`app/views/layouts/application.html.haml`

    = metrika_init

You can manually specify those counters that you want to use.
`config/environments/<environment>.rb`

    YM.counter = "" # You shoul insert you Yandex Metrica code
    YM.set_counters :webvisor, :trackLinks

You can adjust the metric for the request asynchronously.

    = metrika_init(async: true) # By default

Or synchronously...

    = metrika_init(async: false)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
