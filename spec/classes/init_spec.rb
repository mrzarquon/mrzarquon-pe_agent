require 'spec_helper'
describe 'pe_agent' do

  context 'with defaults for all parameters' do
    it { should contain_class('pe_agent') }
  end
end
