require "rails_helper"

describe Movie do
  let(:title) { "Arrival" }
  let(:attributes) { { title: title } }
  subject { described_class.new(attributes) }

  it "can create a record" do
    expect(subject.save).to be_truthy
  end

  context "when the title is empty" do
    let(:title) { "" }

    before { subject.valid? }

    it "is not valid" do
      expect(subject.errors).to include(:title)
    end
  end

  it "has a storyline" do
    expect(subject.attributes).to include(:storyline)
  end

  it "has a release_date" do
    expect(subject.attributes).to include(:release_date)
  end

  it "has a genre" do
    expect(subject.attributes).to include(:genre)
  end

  it "has an imdb_link" do
    expect(subject.attributes).to include(:imdb_link)
  end
end
