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

    context "method does not exist on the model" do
      let(:method_name) { :skill_level }

      it "adds a class method to the model" do
        chain.constant_name.should respond_to(method_name)
      end
    end

    context "attribute does not exist on the model" do
      let(:method_name) { :foo }

      it "does not create the scope" do
        Candidate.should_not respond_to(:foo)
      end
    end
  end

  describe "#chain!" do
    let(:scope_chain) { Refined::ScopeChain.new("Candidate", criteria) }
    subject { scope_chain.chain! }

    before do
      Candidate.destroy_all
      Candidate.create(status: "pending")
      Candidate.create(status: "hired")
    end

    context "with no criteria" do
      let(:criteria) { {} }

      it "returns all" do
        subject.count.should == 2
      end
    end

    context "with criteria" do
      let(:criteria) { { status: "pending" } }

      it "scopes by the given criteria" do
        subject.count.should == 1
      end
    end
  end

  describe "#insert_method" do
    let(:chain) { Refined::ScopeChain.new("Candidate") }
    let(:criteria) { nil }
    let(:method_name) { :skill_level }
    let(:args) { [method_name, criteria] }

    before { chain.send(:insert_method, *args) }

    it "adds a class method to the model" do
      chain.constant_name.should respond_to(method_name)
    end
  end

end
