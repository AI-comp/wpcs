module ApplicationHelper
  def link_to_google_docs(id)
    link_to('https://docs.google.com/document/d/' + id)
  end

  def format_date(date_time, format = nil)
    format = "%Y/%m/%d %H:%M" unless format
    return date_time.strftime(format)
  end

  def format_backtrace(messages)
    def same_prefix(lhs, rhs)
      len = 0.upto(lhs.size) do |i|
        break i if lhs[i] != rhs[i]
      end
      lhs[0...len]
    end

    gems = messages.reject{|_| _.starts_with?(Rails.root.to_s)}
    prefix = gems.reduce {|res,e| same_prefix(res,e) }.sub(/\/$/, '')
    "#{prefix}\n" + messages.map {|e| '    ' + e.sub(prefix, '').sub(Rails.root.to_s, '#{Rails.root}') }.join("\n")
  end

  def format_hash(hash)
    hash.map {|k,v| "#{k}: #{v}" }.join("\n")
  end

end
