require 'rails_helper'

describe Career do
  context "validations" do
    it { expect(subject).to validate_presence_of(:name)}
    it { expect(subject).to validate_uniqueness_of(:name)}
  end

  describe "#all" do
    before do
      create(:career, name:"Lic. Ciencias Computación")
    end

    it "should cache content" do
      expect(Career.all.map(&:name)).to include("Lic. Ciencias Computación")
      create(:career, name:"Lic. Biología")
      expect(Career.all.map(&:name)).not_to include("Lic. Biología")
    end

    it "should force cache reload" do
      expect(Career.all.map(&:name)).to include("Lic. Ciencias Computación")
      create(:career, name:"Lic. Biología")
      expect(Career.all(true).map(&:name)).to include("Lic. Biología")
    end
  end
end
