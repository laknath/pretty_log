module PrettyLog
  def self.included(base)
    base.extend(ClassMethods)
  end

  def pretty_log(columns = nil)
    (columns || self.class.printable_fields).collect {|name|
      if has_attribute?(name)
       "#{ANSI.send(PrettyLog.config.key_colour)} #{name}: #{ANSI.send(PrettyLog.config.value_colour)} #{self.send(name)}"
      end
    }.compact.join(PrettyLog.config.seperator)
  end

  def self.config(&block)
    @config ||= Configuration.new
    block.call(@config) if block
    @config
  end

  class Configuration
    #key colour
    attr_accessor :key_colour

    #value colour
    attr_accessor :value_colour

    #Seperator
    attr_accessor :seperator

    private
    def initialize
      yield(self) if block_given?
      initialize_defaults
    end

    def initialize_defaults
      @key_colour ||= 'green'
      @value_colour ||= 'blue'
      @seperator ||= ', '
    end
  end

  module ClassMethods
    attr_writer :printable_fields

    def printable_fields
      @printable_fields ||= column_names
    end
  end
end

ActiveRecord::Base.send :include, PrettyLog
