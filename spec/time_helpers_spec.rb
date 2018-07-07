
RSpec.describe TimeHelpers do
  it 'count hours in a year' do
    expect(Yarray.hours_in_year(2017)).to eq(8760)
    expect(Yarray.hours_in_year(2016)).to eq(8784)
  end

  it 'count hours in a month' do
    expect(Yarray.hours_in_month(2017, 1)).to eq(744)
    expect(Yarray.hours_in_month(2017, 2)).to eq(672)
    expect(Yarray.hours_in_month(2017, 3)).to eq(743)
    expect(Yarray.hours_in_month(2017, 4)).to eq(720)
    expect(Yarray.hours_in_month(2017, 10)).to eq(745)
    expect(Yarray.hours_in_month(2016, 2)).to eq(696)
  end

  it 'count hours in a day' do
    expect(Yarray.hours_in_day(2017,1,1)).to eq(24)
    expect(Yarray.hours_in_day(2017,3,26)).to eq(23)
    expect(Yarray.hours_in_day(2017,10,29)).to eq(25)
  end

end
