# Yandex::Metrica::Rails
[![Coverage
Status](https://coveralls.io/repos/saratovsource/yandex-metrica-rails/badge.png?branch=master)](https://coveralls.io/r/saratovsource/yandex-metrica-rails)

Yandex Metrica gem for Rails 3.x. It based on [google-analytics-rails]: https://github.com/bgarret/google-analytics-rails gem.

## Installation

Add this line to your application's Gemfile:

    gem 'yandex-metrica-rails'

And then execute:

    $ bundle

## Usage

`config/environments/<environment>.rb`

    YM.counter = "" # You shoul insert you Yandex Metrica code

You must leave this field blank if you do not want to display the metric
on the page for that environment.
`app/views/layouts/application.html.haml`

    = metrica_init

You can manually specify those counters that you want to use.
`config/environments/<environment>.rb`

    YM.counter = "" # You shoul insert you Yandex Metrica code
    YM.set_counters :webvisor, :trackLinks

You can adjust the metric for the request asynchronously.

    = metrica_init(async: true) # By default

Or synchronously...

    = metrica_init(async: false)

#### Available settings:

    = metrica_init(async: false, clickmap: true, noscript: false)

`webvisor`   : WebVisor
`clickmap`   : Click map
`trackLinks` : External links, file downloads and "Share" button report
`trackHash`  : Hash tracking in the browser address window
`accurateTrackBounce` : Accurate bounce rate
`noscript`   : Show `noscript` tag at the page. `true` by default.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
