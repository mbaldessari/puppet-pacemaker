module Puppet::Parser::Functions
  newfunction(
      :is_pcs_010,
      type: :rvalue,
      doc: <<-eof
Return the version of the installed pcs command.
      eof
  ) do |args|
    cmd = "/usr/sbin/pcs --version"
    version = `#{cmd}`
    ret = $?
    if not ret.success?
      raise Puppet::Error, "#{cmd} failed with #{version}: #{ret}"
    end
    return true if Gem::Version.new(version) >= Gem::Version.new('0.10.0')
    false
  end
end
