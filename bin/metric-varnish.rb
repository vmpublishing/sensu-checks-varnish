#!/usr/bin/env ruby


require 'sensu-plugin/metric/cli'


class MetricVarnish < Sensu::Plugin::Metric::CLI::Graphite

  option :sudo,
         short:            '-s',
         long:             '--sudo',
         description:      'run varnishstat as sudo (and possibly avoid running sensu as root)',
         boolean:          true,
         default:          false

  option :varnish_name,
         short:            '-n VARNISH_NAME',
         long:             '--name VARNISH_NAME',
         description:      'The varnishd instance to get data from'

  option :fields,
         short:            '-f fieldlist',
         long:             '--fields fieldlist',
         description:      'The stats fields to get from varnish, comma sepparated. See varnishstat -f',
         default:          ''

  option :scheme,
         short:            '-C SCHEME',
         long:             '--scheme SCHEME',
         description:      'Metric naming scheme, text to prepend to metric and scheme_append',
         default:          "#{Socket.gethostname}"

  option :scheme_append,
         short:            '-S APPEND_STRING',
         long:             '--scheme-append APPEND_STRING',
         description:      'Set a string that will be placed right after the host identification and the script identification but before the measurements',
         default:          nil

  def run

    # init variable
    command = ""

    # enable sudo use if requested
    command += "sudo " if config[:sudo]

    # basic command
    command += "varnishstat -1"

    # added requested fields (or nothing)
    command += config[:fields].split(',').map{|field| " -f #{field}"}.join(' ')

    # fetch stats
    stats_string = `#{command}`

    # send them along
    base_path = config[:scheme]
    base_path += ".#{config[:scheme_append]}" if config[:scheme_append]
    stats_string.split("\n").each do |stat_line|
      stats = stat_line.split(' ').compact
      output "#{base_path}.#{stats[0].gsub(/[^a-zA-Z0-9_\.]/, '_')}", stats[1]
    end

  end

end

