
# fugit

[![Build Status](https://secure.travis-ci.org/floraison/fugit.svg)](http://travis-ci.org/floraison/fugit)
[![Gem Version](https://badge.fury.io/rb/fugit.svg)](http://badge.fury.io/rb/fugit)

Time tools for [flor](https://github.com/floraison/flor) and the floraison project.

## `Fugit::Cron`

```ruby
require 'fugit'

c = Fugit::Cron.parse('0 0 * *  sun')

p Time.now # => 2017-01-03 09:53:27 +0900

p c.next_time # => 2017-01-08 00:00:00 +0900
```

Example of cron strings understood by fugit:
```ruby
'5 0 * * *'         # 5 minutes after midnight, every day
'15 14 1 * *'       # at 1415 on the 1st of every month
'0 22 * * 1-5'      # at 2200 on weekdays
'0 22 * * mon-fri'  # idem
'23 0-23/2 * * *'   # 23 minutes after 00:00, 02:00, 04:00, ...

'@yearly'    # turns into '0 0 1 1 *'
'@monthly'   # turns into '0 0 1 * *'
'@weekly'    # turns into '0 0 * * 0'
'@daily'     # turns into '0 0 * * *'
'@midnight'  # turns into '0 0 * * *'
'@hourly'    # turns into '0 * * * *'

'0 0 L * *'     # last day of month at 00:00
'0 0 last * *'  # idem
'0 0 -7-L * *'  # from the seventh to last to the last day of month at 00:00

# and more...
```

## LICENSE

MIT, see [LICENSE.txt](LICENSE.txt)

