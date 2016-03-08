require 'spec_helper'

describe 'yum-gitlab-ce::default' do
  if os[:family] == 'redhat'
    describe file('/etc/yum.repos.d/gitlab_gitlab-ce.repo') do
      it { should be_file }
      it { should exist }
      its(:content) do
	should match %r{baseurl=https://packages\.gitlab\.com/gitlab/gitlab-ce/el/\$releasever/\$basearch}
      end
    end
  else
    skip 'skipping: unsupported platform'
  end
end
