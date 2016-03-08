yum-gitlab-ce Cookbook
======================

[![Build Status](https://secure.travis-ci.org/atomic-penguin/cookbook-yum-gitlab-ce.png?branch=master)](http://travis-ci.org/atomic-penguin/cookbook-yum-gitlab-ce)

Configures repo file, via attributes, for Gitlab Community Edition 

This is a simple cookbook, which points at the gitlab-ce Omnibus package hosted
on packages.gitlab.com.  One may override `yum.gitlab-ce.baseurl` to point
an alternate mirror of gitlab-ce Omnibus packages.

Requirements
------------

This cookbook depends on the `yum_repository` provider from the `yum` cookbook.
You need to have a RHEL family platform, and yum, to use the cookbook.

#### cookbooks 

- `yum` - Opscode maintained v3.0.x cookbook

Attributes
----------
The following are overridable attributes, in the `yum['gitlab-ce']` namespace.

#### yum-gitlab-ce::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['repositoryid']</tt></td>
    <td>String</td>
    <td>Name of the repository</td>
    <td><tt>gitlab_gitlab-ce</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['baseurl']</tt></td>
    <td>String</td>
    <td>URL where repodata folder is located. 
        Given domain example.com; platform_family rhel; and platform_version 6.4 the default would be:</td>
    <td><tt>https://packages.gitlab.com/gitlab/gitlab-ce/el/$releasever/$basearch</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['gpgkey']</tt></td>
    <td>String</td>
    <td>URL where GPG key is located.</td>
    <td><tt>https://packages.gitlab.com/gpg.key</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['gpgcheck']</tt></td>
    <td>true/false</td>
    <td>Whether, or not, to validate signed packages from this repository against the GPG key specified.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['sslverify']</tt></td>
    <td>true/false</td>
    <td>Whether, or not, to verify the TLS certificate at the baseurl.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['sslcacert']</tt></td>
    <td>String</td>
    <td>TLS CA Bundle</td>
    <td><tt>/etc/pki/tls/certs/ca-bundle.crt</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['enabled']</tt></td>
    <td>true/false</td>
    <td>Disable, or enable, repository</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['managed']</tt></td>
    <td>true/false</td>
    <td>Whether, or not, Chef should manage the gitlab_gitlab-ce.repo file</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['yum']['gitlab-ce']['makecache']</tt></td>
    <td>true/false</td>
    <td>Whether Chef should update the yum cache when installing the repo file.</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### yum-gitlab-ce::default

Optionally, set attributes in a role, and
include `yum-gitlab-ce` in your node's `run_list`:

```
default_attributes(
  :yum => {
    :gitlab-ce => {
      :baseurl => {
        "http://yum.example.com/yum/$releasever/$basearch" 
      }
    }
  }
)
```

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[yum-gitlab-ce]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Author:: Eric G. Wolfe
Copyright:: 2016

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
