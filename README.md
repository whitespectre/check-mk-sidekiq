# CheckMK agent for Sidekiq

This is a library to create CheckMK agents and an agent for Sidekiq.

CheckMK checks should be written separately.

## Usage

```
gem install --no-rdoc --no-ri check-mk-sidekiq
check-mk-sidekiq
```

To actually use it you should put a shell wrapper or symlink to CheckMK agent dir.

By default agent connects to Redis at localhost.
You can use different location of Redis through commandline keys, see `check-mk-sidekiq -h`. Redis Sentinel is supported too.

The agent outputs parameters for `processed`, `failed`, `enqueued`, `workers_size` as reported by Sidekiq.

## API

To write your own agent:
* Inherit your class from `CheckMK::Agents::DummyAgent`
* Define `AGENT_NAME` to be used in check_mk output
* Defined `stats()` function to return hash of stats, like `{ foo: 1, bar 2 }`
* Create wrapper binary to call your agent class

## License and authors

* License: MIT (C) Whitespectre
* Author: Timur Batyrshin

