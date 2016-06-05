RSpec.describe PagePolicy do
  let(:user) { FactoryGirl.create :user }
  let(:admin) { FactoryGirl.create :user, :admin }

  subject { described_class }

  permissions :home? do
    it { is_expected.to permit(nil, nil)     }
    it { is_expected.to permit(user, nil)    }
    it { is_expected.to permit(admin, nil)   }
    it { is_expected.to permit(user, :home)  }
    it { is_expected.to permit(admin, :home) }
  end
end
