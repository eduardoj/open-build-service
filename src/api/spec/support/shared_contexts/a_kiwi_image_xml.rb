RSpec.shared_context 'a kiwi image xml' do
  let(:kiwi_xml) do
    <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<image name="Christians_openSUSE_13.2_JeOS" displayname="Christians_openSUSE_13.2_JeOS" schemaversion="5.2">
  <description type="system">
    <author>Christian Bruckmayer</author>
    <contact>noemail@example.com</contact>
    <specification>Tiny, minimalistic appliances</specification>
  </description>
  <packages type="image" patternType="onlyRequired">
    <package name="e2fsprogs"/>
    <package name="aaa_base"/>
    <package name="branding-openSUSE"/>
    <package name="patterns-openSUSE-base"/>
    <package name="grub2"/>
    <package name="hwinfo"/>
    <package name="iputils"/>
    <package name="kernel-default"/>
    <package name="netcfg"/>
    <package name="openSUSE-build-key"/>
    <package name="openssh"/>
    <package name="plymouth"/>
    <package name="polkit-default-privs"/>
    <package name="rpcbind"/>
    <package name="syslog-ng"/>
    <package name="vim"/>
    <package name="zypper"/>
    <package name="timezone"/>
    <package name="openSUSE-release-dvd"/>
    <package name="gfxboot-devel" bootinclude="true"/>
  </packages>
  <repository type="rpm-md">
    <source path="http://download.opensuse.org/update/13.2/"/>
  </repository>
  <repository type="rpm-md">
    <source path="http://download.opensuse.org/distribution/13.2/repo/oss/"/>
  </repository>
</image>
    XML
  end
end
