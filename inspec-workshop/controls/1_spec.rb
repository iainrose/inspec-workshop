control "cis-1-2-1" do
  impact 1.0
  title "1.2.1 Ensure package manager repositories are configured (Not Scored)"
  desc "Systems need to have package manager repositories configured to ensure they receive the latest patches and updates."
  describe command('yum repolist') do
   its('stdout') { should match (/CentOS-6 - Base/) }
 end
end

control "cis-1-2-2" do
  impact 1.0
  title "1.2.2 Verify that gpgcheck is Globally Activated (Scored)"
  desc "The gpgcheck option, found in the main section of the /etc/yum.conf file determines if an RPM package's signature is always checked prior to its installation."
  describe file('/etc/yum.conf') do
  its('content') { should match /gpgcheck=1/ }
  end
end

control "cis-1-5-1" do
  impact 1.0
  title "1.5.1 Set User/Group Owner on /etc/grub.conf (Scored)"
  desc "Set the owner and group of /etc/grub.conf to the root user."
  describe file('/etc/grub.conf') do
  its('owner') { should eq 'root' }
  its('group') { should eq 'root'}
  end
end
