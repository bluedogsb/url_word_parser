## Code

- Requires ruby-3.2.0 with openssl
- run `bundle install`

## Usage

- run `rake console`:

In Pry console:

- `url = "https://www.cnn.com/2024/02/23/tech/att-outage-customer-service/index.html"`
- `uw = UrlWords.new(url: "https://cnn.com")`
- `uw.run`

* To enable puts output, set do_puts: true

- `url = "https://www.cnn.com/2024/02/23/tech/att-outage-customer-service/index.html"`
- `uw = UrlWords.new(url: "https://cnn.com", do_puts: true)`
- `uw.run`
