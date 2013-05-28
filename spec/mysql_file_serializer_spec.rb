require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Chicago::Flow::MysqlFileSerializer do
  it "serializes nil into \\N" do
    subject.serialize(nil).should == "\\N"
  end

  it "serializes true into '1'" do
    subject.serialize(true).should == "1"
  end

  it "serializes false into '0'" do
    subject.serialize(false).should == "0"
  end

  it "serializes times into mysql time format" do
    subject.serialize(Time.local(2011,01,02,10,30,50)).should == "2011-01-02 10:30:50"
  end

  it "serializes datetimes into mysql time format" do
    subject.serialize(DateTime.new(2011,01,02,10,30,50)).should == "2011-01-02 10:30:50"
  end

  it "serializes dates into mysql date format" do
    subject.serialize(Date.new(2011,01,02)).should == "2011-01-02"
  end
end
