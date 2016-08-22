#!/usr/bin/env ruby

require 'sensu-plugin/metric/cli'

class MetricVarnish < Sensu::Plugin::Metric::CLI::Graphite

  option :sudo,
         short:            '-s',
         long:             '--sudo',
         description:      'run varnishstat as sudo (and possibly avoid running sensu as root)',
         boolean:          true,
         default:          false

  option :scheme,
         short:            '-C SCHEME',
         long:             '--scheme SCHEME',
         description:      'Metric naming scheme, text to prepend to metric and scheme_append',
         default:          "#{Socket.gethostname}.php-fpm"

  option :scheme_append,
         short:            '-S APPEND_STRING',
         long:             '--scheme-append APPEND_STRING',
         description:      'Set a string that will be placed right after the host identification and the script identification but before the measurements',
         default:          nil


  def run
  end

end

