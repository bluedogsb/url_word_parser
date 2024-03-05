## Code

- Requires ruby-3.2.0 with openssl
- run `bundle install`

## Usage

- from terminal run: `rake console` to open Pry console

In Pry console:

- `url = "https://www.cnn.com/2024/02/23/tech/att-outage-customer-service/index.html"`
- `uw = UrlWords.new(url: url)`
- `uw.run`

* To enable puts output, set do_puts: true

- `url = "https://variety.com/2024/film/news/dune-2-box-office-analysis-opening-weekend-timothee-chalamet-1235928762/"`
- `uw = UrlWords.new(url: url, do_puts: true)`
- `uw.run`

## Tests

- minitest
- from terminal run: `rake test`
