# Tech Test for Varsity Tutors

## Local Setup

```
bundle install
rake db:setup
rails s
```

## Optional for Development

Uses LiveReload
Type `guard` in terminal to start Livereload server
Chrome Extension [here](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en)

## Tests

Type `rake test` in terminal to run test suite

## Files

All javascript logic is located in `orders.js`

All functionality is in the _orders_ stack.

`workbench.erb` is helpful to speed up designing tricky UI without excessive clicking.

## Make some fake orders

Type `rake fake_orders` in Terminal.

Runs on an endless loop.  Control+C to quit.
