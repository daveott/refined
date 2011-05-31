require 'spec_helper'

describe Refined do
  describe ".refined" do
    let(:criteria) { {status:"pending"} }
    let(:scope_chain) { mock("scope_chain") }
    let!(:candidate) { Candidate.create(status: "pending") }

    before do
      Refined::ScopeChain.stub(:new).and_return(scope_chain)
      Refined::ScopeChain.should_receive(:new).and_return(scope_chain)
      scope_chain.should_receive(:chain!)
    end

    it "returns an array of scoped objects" do
      Candidate.refined(criteria)
    end
  end
end
