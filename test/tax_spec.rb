require_relative '../src/tax'

describe "testing tax class" do
  it "should return basic tax rate" do
    expect(Tax.basic_tax).to eql(10.0)
  end

  it "should return basic tax rate" do
    expect(Tax.import_tax).to eql(5.0)
  end

  it "should calculate basic tax based on price passed" do
    expect(Tax.get_basic_tax_from(10)).to eql(1.0)
  end

  it "should calculate import tax based on price passed" do
    expect(Tax.get_import_tax_from(10)).to eql(0.5)
  end
end
