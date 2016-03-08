#
# Cookbook Name:: yum-gitlab-ce
# Attributes:: default
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

default['yum']['gitlab-ce']['repositoryid'] = 'gitlab_gitlab-ce'
default['yum']['gitlab-ce']['description'] = 'Gitlab CE'
default['yum']['gitlab-ce']['baseurl'] = 'https://packages.gitlab.com/gitlab/gitlab-ce/el/$releasever/$basearch'
default['yum']['gitlab-ce']['gpgcheck'] = true
default['yum']['gitlab-ce']['enabled'] = true
default['yum']['gitlab-ce']['gpgkey'] = 'https://packages.gitlab.com/gpg.key'
default['yum']['gitlab-ce']['sslverify'] = true
default['yum']['gitlab-ce']['sslcacert'] = '/etc/pki/tls/certs/ca-bundle.crt'
default['yum']['gitlab-ce']['managed'] = true
default['yum']['gitlab-ce']['make_cache'] = true
