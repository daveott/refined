require 'spec_helper'

describe Refined do
  describe ".chain_scope" do
    let(:criteria) { {status:"pending"} }

    before { Candidate.create(status: "pending") }

    it "returns an array of scoped objects" do
      Candidate.refined(criteria).should_not be_empty
    end
  end
end
