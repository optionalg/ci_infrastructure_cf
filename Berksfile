source "https://supermarket.getchef.com"


cookbook 'jenkins'
# cookbook 'rbenv', git: 'git@github.com:fnichol/chef-rbenv.git'
cookbook 'rbenv', git: 'https://github.com/bonzofenix/chef-rbenv.git' #adds some chefmatchers
cookbook 'ruby_build'
cookbook 'ci_infrastructure_cf', path: 'cookbooks/ci_infrastructure_cf'
cookbook 'hostsfile'

group :integration do
  cookbook 'jenkins_ci_job', path: 'spec/fixtures/cookbooks/jenkins_ci_job'
  cookbook 'replace_placeholder', path: 'spec/fixtures/cookbooks/replace_placeholder'
  cookbook 'sec_group', path: 'spec/fixtures/cookbooks/sec_group'
  cookbook 'stemcell', path: 'spec/fixtures/cookbooks/stemcell'

end
