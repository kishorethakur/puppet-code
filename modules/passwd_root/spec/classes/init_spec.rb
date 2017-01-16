require 'spec_helper'
describe 'passwd_root' do
  context 'with default values for all parameters' do
    it { should contain_class('passwd_root') }
  end
end
