require 'spec_helper'

describe Idea do
  # To-do: move some of this into a factory:
  let(:user) { User.create(name: "Bob Dylan", email: "bobdyzzle@example.com", password: "bigbob1999") }
  let(:other_user) { User.create(name: "Mark Knopfler", email: "markdaman@example.com", password: "sultanofschwinnng") }
  let(:idea) do 
    idea = user.ideas.build(title: "Shelter From The Storm",
      body: <<-MARKDOWN
        # Shelter From The Storm
         
        Something I just came up with (:
      MARKDOWN
    )

    idea.save
    idea
  end

  subject { idea }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:voters) }
  it { should respond_to(:total_votes) }

  describe "votes for this idea" do
    before do
      idea.vote voter: other_user
    end

    it "should know which users voted for it" do
      idea.voters.should include(other_user)
    end

    it "should know the number of votes it received" do
      expect(idea.total_votes).to eq(1)
    end
  end
end
