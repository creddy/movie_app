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

  describe "title_lower" do
    it "is set on save so that searching can be done without case sensitivity" do
      subject.save
      expect(subject.title_lower).to eq(title.downcase)
    end
  end

  context "release date" do
    let(:release_date) { "2018-02-04" }
    let(:attributes) { { title: title, string_release_date: release_date } }

    it "casts the date string from user input" do
      aggregate_failures do
        expect(subject).to be_valid
        expect(subject.release_date).to eq(Date.parse(release_date))
      end
    end

    context "when the release date is invalid" do
      let(:release_date) { "foobar" }

      it "does not store the release date" do
        aggregate_failures do
          expect(subject).not_to be_valid
          expect(subject.errors).to include(:release_date)
          expect(subject.release_date).to be_nil
        end
      end
    end

    context "#update_attributes" do
      let!(:movie) { Movie.create!(title: "foobar", release_date: Date.parse("2018-01-01")) }
      let(:new_date) { "1999-01-01" }

      it "sets the release_date from the parsed string_release_date" do
        expect { movie.update_attributes(string_release_date: new_date) }
          .to change { movie.release_date }.to(Date.parse(new_date))
      end
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
