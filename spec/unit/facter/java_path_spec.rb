require "spec_helper"

describe Facter::Util::Fact do
  before {
    Facter.clear
    Facter.fact(:kernel).stubs(:value).returns('Linux')
  }

  describe "java_path" do
    context 'returns java executable path when readlink present' do
      it do
        java_path_output = <<-EOS
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
        EOS
        Facter::Util::Resolution.expects(:which).with("readlink").returns(true)
        Facter::Util::Resolution.expects(:exec).with("readlink -e /usr/bin/java").returns(java_path_output)
        Facter.value(:java_path).should == "/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java"
      end
    end

    context 'returns nil when readlink not present' do
      it do
        Facter::Util::Resolution.stubs(:exec)
        Facter::Util::Resolution.expects(:which).with("readlink").at_least(1).returns(false)
        Facter.value(:java_path).should be_nil
      end
    end
  end
end
