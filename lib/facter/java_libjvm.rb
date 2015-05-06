# Fact: java_libjvm
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
Facter.add(:java_libjvm) do
  confine :osfamily => "RedHat"
  setcode do
    if Facter::Util::Resolution.which('rpm')
      java_path = Facter.value(:java_path)
      Facter::Util::Resolution.exec('rpm -qf '+java_path+' -l').lines.find { |l| l =~ /libjvm.so$/}.strip
    end
  end
end

Facter.add(:java_libjvm) do
  confine :osfamily => "Debian"
  setcode do
    if Facter::Util::Resolution.which('dpkg')
      java_path = Facter.value(:java_path)
      java_package = Facter::Util::Resolution.exec('dpkg -S '+java_path).split(':').first
      Facter::Util::Resolution.exec('dpkg -L '+java_package).lines.find { |l| l =~ /libjvm.so$/}.strip
    end
  end
end
