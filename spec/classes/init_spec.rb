require 'spec_helper'
describe 'icecast' do

  context 'with defaults for all parameters' do
    it { should contain_class('icecast') }
  end
end
