unless defined? JRUBY_VERSION
  raise "JavaStreamify only works under JRUBY"
end

module JavaStreamify
  def self.inputstream(from, opts = {})
    gzip = opts[:gz] || opts[:gzip]
    stream = nil
    if from.is_a? Java::JavaIO::InputStream
      stream = from
    elsif from.is_a? String
      stream = java.io.FileInputStream.new(from.to_java_string)
      gzip = true if from =~ /\.gz$/
    elsif from.respond_to? :to_inputstream
      stream = from.to_inputstream
    end
    
    if gzip
      stream = Java::java.util.zip.GZIPInputStream.new(stream)
    end
    
    return stream
  end
  
  def self.outputstream(from, opts={})
    stream = nil
    gzip = opts[:gz] || opts[:gzip]
    if from.is_a? Java::JavaIO::OutputStream
      stream = from
    elsif from.is_a? String
      stream = java.io.FileOutputStream.new(from.to_java_string)
      gzip = true if from =~ /\.gz$/
    elsif from.respond_to? :to_outputstream
      stream = from.to_outputstream
    end
    
    if gzip
      stream = Java::java.util.zip.GZIPOutputStream.new(stream)
    end
    
    return stream
  end
end
   