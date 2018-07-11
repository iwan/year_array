RSpec.describe YearArray do

  context "basic initializer" do
    subject(:ya) { Yarray.new(2018) }
    it { expect(ya).to be_an_instance_of(Yarray) }
    it { expect(ya.size).to eq(8760) }
    it { expect(ya.arr.first).to eq(0.0) }
    it { expect(ya.arr.last).to eq(0.0) }
    it { expect(ya.year).to eq(2018) }
    it { expect(Yarray.new(2016).size).to eq(8784) }
  end

  context "initializer with custom values" do
    subject(:ya) { Yarray.new(2018, value: 1.0) }
    it { expect(ya).to be_an_instance_of(Yarray) }
    it { expect(ya.size).to eq(8760) }
    it { expect(ya.arr.first).to eq(1.0) }
    it { expect(ya.arr.last).to eq(1.0) }
    it { expect(ya.year).to eq(2018) }
  end

  it "check misalignment" do
    ya1 = Yarray.new(2018, value: 1.0)
    ya2 = Yarray.new(2018, value: 3.0)
    ya3 = Yarray.new(2017)
    expect { ya1.raise_error_on_misalignment(ya3)}.to raise_error(MisalignmentError)
    expect { ya1.raise_error_on_misalignment(ya2)}.not_to raise_error(MisalignmentError)
  end

  context "sum of yarrays" do
    subject(:ya1) { Yarray.new(2018, value: 1.0) }
    subject(:ya2) { Yarray.new(2018, value: 3.0) }
    let(:ya3) { ya1+ya2 }

    it { expect(ya3).to be_an_instance_of(Yarray) }
    it { expect(ya3.size).to eq(8760) }
    it { expect(ya3.arr.first).to eq(4.0) }
    it { expect(ya3.arr.last).to eq(4.0) }
  end

  context "diff of yarrays" do
    subject(:ya1) { Yarray.new(2018, value: 1.0) }
    subject(:ya2) { Yarray.new(2018, value: 3.0) }
    let(:ya3) { ya1-ya2 }

    it { expect(ya3).to be_an_instance_of(Yarray) }
    it { expect(ya3.size).to eq(8760) }
    it { expect(ya3.arr.first).to eq(-2.0) }
    it { expect(ya3.arr.last).to eq(-2.0) }
  end

  context "product of yarrays" do
    subject(:ya1) { Yarray.new(2018, value: 1.0) }
    subject(:ya2) { Yarray.new(2018, value: 3.0) }
    let(:ya3) { ya1*ya2 }

    it { expect(ya3).to be_an_instance_of(Yarray) }
    it { expect(ya3.size).to eq(8760) }
    it { expect(ya3.arr.first).to eq(3.0) }
    it { expect(ya3.arr.last).to eq(3.0) }
  end

  context "division between yarrays" do
    subject(:ya1) { Yarray.new(2018, value: 9.0) }
    subject(:ya2) { Yarray.new(2018, value: 3.0) }
    let(:ya3) { ya1/ya2 }

    it { expect(ya3).to be_an_instance_of(Yarray) }
    it { expect(ya3.size).to eq(8760) }
    it { expect(ya3.arr.first).to eq(3.0) }
    it { expect(ya3.arr.last).to eq(3.0) }
  end

  context "minimum between yarrays" do
    subject(:ya1) { Yarray.new(2018, value: 9.0) }
    subject(:ya2) { Yarray.new(2018, value: 3.0) }
    let(:ya3) { Yarray.min(ya1, ya2) }

    it { expect(ya3).to be_an_instance_of(Yarray) }
    it { expect(ya3.size).to eq(8760) }
    it { expect(ya3.arr.first).to eq(3.0) }
    it { expect(ya3.arr.last).to eq(3.0) }
  end

  context "maximum between yarrays" do
    subject(:ya1) { Yarray.new(2018, value: 9.0) }
    subject(:ya2) { Yarray.new(2018, value: 3.0) }
    let(:ya3) { Yarray.max(ya1, ya2) }

    it { expect(ya3).to be_an_instance_of(Yarray) }
    it { expect(ya3.size).to eq(8760) }
    it { expect(ya3.arr.first).to eq(9.0) }
    it { expect(ya3.arr.last).to eq(9.0) }
  end

  it "has positive values" do
    expect(Yarray.new(2018, value: 3.0).any?{|v| v>0}).to eq(true)
    expect(Yarray.new(2018, value: 3.0).any_positive?).to eq(true)
  end

  it "has negative values" do
    expect(Yarray.new(2018, value: -25.0).any?{|v| v<0}).to eq(true)
    expect(Yarray.new(2018, value: -25.0).any_negative?).to eq(true)
  end

  it "doesn't has positive values" do
    expect(Yarray.new(2018, value: -25.0).any?{|v| v>0}).to eq(false)
    expect(Yarray.new(2018, value: -25.0).any_positive?).to eq(false)
  end

  it "doesn't has negative values" do
    expect(Yarray.new(2018, value: 5.0).any?{|v| v<0}).to eq(false)
    expect(Yarray.new(2018, value: 5.0).any_negative?).to eq(false)
  end
end
