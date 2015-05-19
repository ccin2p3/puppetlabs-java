# Fact: java_libjvm_path
#
# Purpose: get path to libjvm.so
#
# Resolution:
#   Lists file in java package and searches for the file
#
# Caveats:
#   Needs to query the package database
#
# Notes:
#   None
Facter.add(:java_libjvm_path) do
  confine :osfamily => "RedHat"
  setcode do
    java_path = Facter.value(:java_path)
    if java_path.empty?
      nil
    elsif Facter::Util::Resolution.which('rpm')
      java_libjvm = Facter::Util::Resolution.exec("rpm -qf #{java_path} -l").lines.find { |l| l =~ /libjvm.so$/}.strip
      File.dirname(java_libjvm)
    end
  end
end

Facter.add(:java_libjvm_path) do
  confine :osfamily => "Debian"
  setcode do
    java_path = Facter.value(:java_path)
    if java_path.empty?
      nil
    elsif Facter::Util::Resolution.which('dpkg')
      java_package = Facter::Util::Resolution.exec('dpkg -S '+java_path).split(':').first
      java_libjvm = Facter::Util::Resolution.exec("dpkg -L #{java_package}").lines.find { |l| l =~ /libjvm.so$/}.strip
      File.dirname(java_libjvm)
    end
  end
end
