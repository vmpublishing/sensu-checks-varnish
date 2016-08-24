# sensu-checks-varnish

Sensu gem to get varnish metrics. Uses plain data out of varnish.
Supports sudo for better access rights management.
Supports more than one varnish instance per host by letting you define an append string (ie: "hostname.appendstring.varnish.MAIN.cache_hits 1").


## DEPENDENCIES

none


## INSTALLATION

This gem will give an actual installation explanation, as the default sensu plugins miss it and the sensu documentation lacks any detailed explanation.

If this gem is listed in rubygems.org, you can just go ahead and do
~~sensu-install -p sensu-check-varnish~~


Updated:
As Sensu expects the naming to be "sensu-plugins-FOO", you need to do it another way:
```
/opt/sensu/embedded/bin/gem install --no-ri --no-rdoc sensu-checks-varnish
```

If this does not work for you, you can still install it; the hard way.
```
git clone git@github.com:vmpublishing/sensu-checks-varnish [SOME_PATH]
cd [SOME_PATH]
/opt/sensu/embedded/bin/gem build *.gemspec
/opt/sensu/embedded/bin/gem install *.gem
```

Alter `/opt/sensu/embedded/bin/gem` to the path to the gem-file sensu uses on your machine.


## USAGE

### metrics

#### Parameters

| name | parameter_name | default value | required | description |
|------|----------------|---------------|----------|-------------|
| sudo | -s, --sudo | false | no | boolean, turns sudo usage on. (ie: `sudo varnishstat -1`) |
| varnish_name | -n, --name | '' | no | custom varnish instance name. Varnish defaults to node name, so this is not required. |
| fields | -f, --fields | '' | no | a comma separated list of fields to get, instead of everything. ie: `varnishstat -1 -f field1 -f field2` |
| scheme | -C, --scheme | [hostname].varnish | no | Metric naming scheme, text to prepend to metric and scheme_append |
| scheme_append | -S, --scheme_append | nil | no | Set a string that will be placed right after the host identification and the script identification but before the measurements (ie. hostname.scheme_append.varnish.slow_requests) |

#### sample json config file for sockets
```
{
  "metrics": {
    "metric_varnish": {
      "type":         "metric",
      "command":      "metric-varnish.rb -s",
      "standalone":   true,
      "interval":     10,
      "timeout":      120,
      "ttl":          180
    }
  }
}
```


## CONTRIBUTING

Bug reports and pull requests are welcome on GitHub at https://github.com/vmpublishing/sensu-checks-varnish.
