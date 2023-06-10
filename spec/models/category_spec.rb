require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many categories_deals' do
      association = described_class.reflect_on_association(:categories_deals)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many deals through categories_deals' do
      association = described_class.reflect_on_association(:deals)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:categories_deals)
    end
  end

  describe 'validations' do
    let(:user) { User.create!(name: 'Test', email: 'sajiba@arafat.com', password: 'daafddf') }
    subject { Category.new(Name: 'Category Name') }
    

    it 'validates presence of name' do
      subject.icon.attach(io: File.open('spec/fixtures/files/test.png'), filename: 'test.png', content_type: 'image/png')
      subject.Name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:Name]).to include("can't be blank")
    end
  end

  describe '#total_deals_amount' do
    let(:user) { User.create(name: 'one', email: 'arafat@sajib.com', password: 'password') }
    let(:category) { Category.create(Name: 'category1', icon: fixture_file_upload('test.png', 'image/png') , user:) }
    let!(:deal1) { Deal.create(name: 'deal_one', amount: 30, :author=> user) }
    let!(:deal2) { Deal.create(name: 'deal_two', amount: 10, :author=> user) }

    before do
      category.deals << deal1
      category.deals << deal2
    end

    it 'returns the total amount of deals for the category' do
      expect(category.deals.sum(:amount)).to eq(40)
    end

  end
  describe '#deals_ordered_by_most_recent' do
    let(:user) { User.create(name: 'one', email: 'arafat@sajib.com', password: 'password') }
    let(:category) { Category.create(Name: 'cat1',icon: fixture_file_upload('test.png', 'image/png'), user:) }
    let!(:deal1) { Deal.create(name: 'd1', amount: 20, created_at: 1.day.ago, :author=> user) }
    let!(:deal2) {Deal.create(name: 'd2', amount: 20, created_at: Time.now, :author=> user) }

    before do
      category.deals << deal1
      category.deals << deal2
    end

    it 'returns the deals ordered by most recent' do
      expect(category.deals.order(created_at: :desc)).to eq([deal2, deal1])
    end
  end
end