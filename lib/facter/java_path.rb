# Fact: java_path
#
# Purpose: get absolute path of java executable
#
# Resolution:
#   Uses `readlink` to resolve the path of `/usr/bin/java`
#
# Caveats:
#   Requires readlink
#
# Notes:
#   None
Facter.add(:java_path) do
  setcode do
    if Facter::Util::Resolution.which('readlink')
      Facter::Util::Resolution.exec('readlink -f /usr/bin/java').strip
    end
  end
end
