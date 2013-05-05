ActiveSupport::TaggedLogging.class_eval do
  undef :add
  def add(severity, message = nil, progname = nil, &block)
    message = (block_given? ? block.call : progname) if message.nil?
    if message.to_s.empty?
      @logger.add(severity, '', progname)
    else
      @logger.add(severity, "#{severity_tag(severity)}#{tags_text}#{message}", progname)
    end
  end

  private
  begin
    tags = {
      fatal: 31, # red
      error: 31, # red
      warn:  33, # yellow
      info:  32, # green
      debug: 37, # gray
    }
    @tags = tags.each.with_object({}) do |(k, v), dst|
      key = k.upcase
      val = ActiveSupport::BufferedLogger::Severity.const_get(key)
      tag = "[\e[0;#{v}m" + key.to_s.ljust(5) + "\e[0m] "
      dst[val] = tag
    end
  end
  def severity_tag(severity)
    self.class.instance_variable_get(:@tags)[severity] || ''
  end
end
