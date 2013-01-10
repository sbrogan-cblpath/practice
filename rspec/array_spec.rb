describe Array do

  context "#first" do
    let (:array) { [1, 2, 3] }
    it { should eq(1) }
  end

  context "#last" do
    it { should be_a_kind_of(Array) }
  end
end
