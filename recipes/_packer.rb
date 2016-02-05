#https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip
#
#https://github.com/github/hub/releases/download/v2.2.2/hub-linux-amd64-2.2.2.tgz

packer_version = node['rexden']['packer_version']
packer_fname="packer-#{packer_version}"
packer_url="https://releases.hashicorp.com/packer/#{packer_version}/packer_#{packer_version}_linux_amd64.zip"

package 'unzip'

remote_file "/root/#{packer_fname}.zip" do
  source packer_url
  checksum node['rexden']['packer_checksum']
  owner 'root'
  group 'root'
  action :create
end

execute "uncompress hub in /opt" do
  cwd "/usr/bin"
  command "/bin/unzip /root/#{packer_fname}"
  not_if "[ -x /usr/bin/packer ]"
end

#link '/usr/bin/hub' do
#  to "/opt/#{hub_fname}/bin/hub"
#end

# vi: expandtab ts=2 
