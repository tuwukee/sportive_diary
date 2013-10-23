require 'spec_helper'

describe Drill do
  it { should validate_presence_of(:name) }
end
