require 'spec_helper'

describe Profile do

  it { should belong_to(:player) }
  it { should belong_to(:coach) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it "should be valid" do
    profile = FactoryGirl.build(:profile)
    profile.should be_valid
  end

  it "should not be valid without first name" do
    profile = FactoryGirl.build(:profile, :first_name => "")
    profile.should have(1).error_on(:first_name)
  end

  it "should not be valid without last name" do
    profile = FactoryGirl.build(:profile, :last_name => "")
    profile.should have(1).error_on(:last_name)
  end

  it "should not be valid if first name is longer than 255 symbols" do
    profile = FactoryGirl.build(:profile, :first_name => "a" * 256)
    profile.should have(1).error_on(:first_name)
  end

  it "should not be valid if last name is longer than 255 symbols" do
    profile = FactoryGirl.build(:profile, :last_name => "a" * 256)
    profile.should have(1).error_on(:last_name)
  end
end
