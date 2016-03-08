#
# Cookbook Name:: yum-gitlab-ce
# Spec:: default
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

require 'spec_helper'

shared_examples 'rhel' do |platform, version|
  context "on #{platform} #{version}" do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(step_into: ['yum_repository'],
                                        platform: platform,
                                        version: version)
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates gitlab_gitlab-ce yum repository' do
      expect(chef_run).to create_yum_repository('gitlab_gitlab-ce')
    end

    it 'renders repo file with packages.gitlab.com baseurl' do
      expect(chef_run).to render_file('/etc/yum.repos.d/gitlab_gitlab-ce.repo').with_content(
        'baseurl=https://packages.gitlab.com/gitlab/gitlab-ce/el/$releasever/$basearch'
      )
    end
  end
end

describe 'yum-gitlab-ce::default' do
  platforms = {
    'centos' => [6.7, 7.0]
  }

  platforms.each do |platform, versions|
    versions.each do |version|
      it_behaves_like 'rhel', platform, version
    end
  end
end
