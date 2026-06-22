require 'rails_helper'

RSpec.describe Pool, type: :model do

  describe "#can_delete?" do
    it 'should return true' do
      pool = build(:pool)
      expect(pool.can_delete?).to eq(false)
    end

    it 'should return false' do
      pool = build(:pool, :deletable)
      expect(pool.can_delete?).to eq(true)
    end
  end

  describe "validations" do
    it "should be valid" do
      pool = build(:pool)
      expect(pool).to be_valid
    end
  end
end
