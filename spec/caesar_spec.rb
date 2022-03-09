require './lib/caesar'

describe "#cipher" do
  it "returns a string" do
    expect(cipher("hello", 3)).to be_a(String)
  end

  it "encrypts a string using caesar's cipher" do
    expect(cipher("hello", 3)).to eql("khoor")
  end

  it "does not encrypt space, numbers or special characters" do
    expect(cipher("h 1@!a", 3)).to eql("k 1@!d")
  end

  it "encrypts uppercase" do
    expect(cipher("HELLO", 3)).to eql("KHOOR")
  end

  it "does not encrypt if key is 0" do
    expect(cipher("hello", 0)).to eql("hello")
  end

  it "it wraps around the alphabet when going over 'z'" do
    expect(cipher("wxYz", 2)).to eql("yzAb")
  end

  it "raises an ArgumentError if the key is above 26" do
    expect {
      cipher("hello", 120)
    }.to raise_error(ArgumentError)
  end

  it "raises an ArgumentError if the first argument is not a string" do
    expect {
      cipher(12, 7)
    }.to raise_error(ArgumentError)
  end
end