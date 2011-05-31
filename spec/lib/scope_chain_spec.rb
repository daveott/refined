require 'spec_helper'

describe Refined::ScopeChain do
  describe "#constant_name" do
    subject { Refined::ScopeChain.new("Candidate").constant_name }
    it { should == Candidate }
  end

  describe "#construct" do
    let(:chain) { Refined::ScopeChain.new("Candidate") }
    let(:criteria) { nil }

    before { chain.construct(method_name, criteria) }

    context "the method does not exist on the model" do
      let(:method_name) { :skill_level }
      it "adds a class method to the model" do
        chain.constant_name.should respond_to(method_name)
      end
    end
  end

  describe "#chain!" do
    let(:scope_chain) { Refined::ScopeChain.new("Candidate", criteria) }
    subject { scope_chain.chain! }

    let(:criteria) { { status: "pending" } }

    before do
      Candidate.create(status: "pending")
      Candidate.create(status: "hired")
    end

    it "scopes by the given criteria" do
      subject.count.should == 1
    end
  end

end
