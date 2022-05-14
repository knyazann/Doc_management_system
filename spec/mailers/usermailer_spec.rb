require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
    let(:task) { Task.new }
    let(:mail) { described_class.with((task: :task).new_task_email}

    it "sends an email" do
        expect { mail.new_task_email }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  
end