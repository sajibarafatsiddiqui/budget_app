require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many deals' do
      association = described_class.reflect_on_association(:deals)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq(:author_id)
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it 'has many categories' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq(:user_id)
      expect(association.options[:dependent]).to eq(:destroy)
    end
  end

  describe 'validations' do
    subject { User.new(name: 'Test') }

    it 'validates presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end
  end
end
