require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:creator) }

    it { should have_many(:likes) }

    it { should have_many(:meals) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
