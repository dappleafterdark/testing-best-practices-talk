require 'rspec/core/formatters/base_text_formatter'

class NoSummaryFormatter < RSpec::Core::Formatters::BaseTextFormatter

  # def example_failed *args; end
  # def example_pending *args;  end
  # def dump_failures *args; end
  # def dump_pending *args; end
  # def message msg; end
  def dump_summary *args; end
  def seed *args; end

end
