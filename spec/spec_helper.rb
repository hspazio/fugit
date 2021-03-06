
#
# Specifying fugit
#
# Sun Jan  1 12:09:21 JST 2017  Ishinomaki
#

require 'pp'
require 'ostruct'

require 'chronic'
::Khronic = ::Chronic
Object.send(:remove_const, :Chronic)

require 'fugit'


module Helpers

  def jruby?; !! RUBY_PLATFORM.match(/java/); end
  def windows?; Gem.win_platform?; end


  def in_zone(zone_name, &block)

    prev_tz = ENV['TZ']
    ENV['TZ'] = zone_name if zone_name

    block.call

  ensure

    ENV['TZ'] = prev_tz
  end

  def require_chronic

    Object.const_set(:Chronic, Khronic)
  end

  def unrequire_chronic

    Object.send(:remove_const, :Chronic)
  end
end # Helpers

RSpec.configure do |c|

  c.alias_example_to(:they)
  c.alias_example_to(:so)
  c.include(Helpers)
end


  # A _bad_inc that doesn't progress, to test #next_time and
  # #previous_time loop breakers...
  #
class Fugit::Cron::TimeCursor
  def _bad_inc(i)
    @t = @t + 0
    self
  end
  alias _original_inc inc
end

  # Simulating ActiveSupport Time.zone
  #
class Time
  class << self
    attr_accessor :_zone
    def _zone=(name)
      @zone = OpenStruct.new(tzinfo: ::TZInfo::Timezone.get(name))
    end
  end
end

