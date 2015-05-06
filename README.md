# sidetiq-freebsd-example
Example usage of Sidetiq on FreeBSD.

# Setup
Install and start redis on FreeBSD

```
sudo pkg install redis
sudo service redis onestart
```

Or start redis on boot by adding to ```/etc/rc.conf```

```
redis_enable="YES"
```

# Start sidekiq and web interface
```
foreman start
```

# Usage
Create new worker

```ruby
class RecordDiskUsageOnFriday
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { weekly.day(:friday) }

  def perform
    `du -h > /tmp/disk_usage`
  end
end
```

```server.rb``` uses all workers in ```workers``` directory, but sidekiq must be restarted.

Look at dashboard by browsing to

```
/sidekiq
```

Use `sidekiq` as username and password.
