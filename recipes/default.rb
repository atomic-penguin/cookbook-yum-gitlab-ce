#
# Cookbook Name:: yum-gitlab-ce
# Recipe:: default
#
# Copyright 2016 Eric G. Wolfe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

yum_repository node['yum']['gitlab-ce']['repositoryid'] do
  description node['yum']['gitlab-ce']['description'] unless node['yum']['gitlab-ce']['description'].nil?
  baseurl node['yum']['gitlab-ce']['baseurl'] unless node['yum']['gitlab-ce']['baseurl'].nil?
  enabled node['yum']['gitlab-ce']['enabled'] unless node['yum']['gitlab-ce']['enabled'].nil?
  gpgcheck node['yum']['gitlab-ce']['gpgcheck'] unless node['yum']['gitlab-ce']['gpgcheck'].nil?
  gpgkey node['yum']['gitlab-ce']['gpgkey'] unless node['yum']['gitlab-ce']['gpgkey'].nil?
  sslcacert node['yum']['gitlab-ce']['sslcacert'] unless node['yum']['gitlab-ce']['sslcacert'].nil?
  sslverify node['yum']['gitlab-ce']['sslverify'] unless node['yum']['gitlab-ce']['sslverify'].nil?
  make_cache node['yum']['gitlab-ce']['make_cache'] unless node['yum']['gitlab-ce']['make_cache'].nil?
  only_if { node['yum']['gitlab-ce']['managed'] }
  action :create
end
