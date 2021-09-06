require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a strong password' do
    subject.password = 'abcdABCD111'
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages.join(', ')).to eq "Change 1 characters of #{subject.name}'s password"
  end
end
