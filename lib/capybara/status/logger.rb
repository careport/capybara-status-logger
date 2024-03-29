require "capybara/status/logger/version"

module Capybara
  module Status
    module Logger
      def print_error(path)
        return if status_code < 400

        trace_elems = find_all('.trace-frames')
        error_title = find('h1').text
        scraped_trace = trace_elems.map(&:text).join "\n"

        raise Capybara::WindowError, <<~EOF
          Got status #{status_code} visiting #{path}

          #{error_title}
          Trace:
          #{scraped_trace}
        EOF
      end
    end
  end
end
