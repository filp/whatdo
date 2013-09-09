require 'spec_helper'

describe User do
  let(:user) { User.create(name: "Banana Joe", email: "gobananas@example.com", password: "love4turnips") }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
end
