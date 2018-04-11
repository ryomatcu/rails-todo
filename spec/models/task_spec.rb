require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with title and description" do
    task = FactoryBot.build(:task)
    expect(task).to be_valid
  end
end
