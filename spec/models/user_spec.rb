RSpec.describe User, type: :model do
  let(:user) { create :user }

  subject { user }

  it { should respond_to :email }
end
