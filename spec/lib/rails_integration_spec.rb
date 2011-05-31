require 'spec_helper'

Refined::Railtie.insert

describe "Rails Integration:", Refined do
  let(:model) { Skill }
  subject { model }
  it { should respond_to(:refined) }
end
