require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without a name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without an email of minimum length 12 characters" do
    user = User.new(name: 'Safa', email: "me@mine.com")
    expect(user).to_not be_valid
  end

  it "is valid with an email of minimum length 12 characters" do
    user = User.new(name: 'Chris', email: "admin@admin.com")
    expect(user).to be_valid
  end

   it "is not valid without a name of minimum length 3 characters" do
    user = User.new(name: 'Safa', email: "me@mine.com")
    expect(user).to_not be_valid
  end

  it "is valid with a name of minimum length 3 characters" do
    user = User.new(name: 'Chris', email: "admin@admin.com")
    expect(user).to be_valid
  end

  describe 'associations' do
    it { should have_many(:events).class_name('Event').with_foreign_key(:creator_id) }
    it { should have_many(:attended_events).through(:event_attendees) }
    it { should have_many(:event_attendees).with_foreign_key(:attendee_id) }
  end
end
