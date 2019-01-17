#
# Cookbook:: Swapfile
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


#Creating 4G Swapfile and making fstab entry. 
bash 'Create and mount Swapfile' do
code <<-EOH
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
cp /etc/fstab /etc/fstab.bak
echo "/swapfile none swap sw 0 0" | tee -a /etc/fstab
EOH
not_if "cat /etc/fstab | grep -e '/swapfile none swap sw 0 0'"
end
