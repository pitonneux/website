require "rails_helper"

RSpec.describe MessageMailerMailer, type: :mailer do
  describe "send_to_admin" do
    let(:mail) { MessageMailerMailer.send_to_admin }

    it "renders the headers" do
      expect(mail.subject).to eq("Send to admin")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
