require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validates" do
    describe "skype_name" do
      context "with valid text" do
        subject{ User.new(skype_name: "live:umeyuki_,.-") }
        it { is_expected.to be_valid}
      end

      context "with less than 6 characters" do
        subject{ User.new(skype_name: "umeo") }
        it { is_expected.not_to be_valid}
      end

      context "with less than 32 characters" do
        subject{ User.new(skype_name: "ume" * 11 ) }
        it { is_expected.not_to be_valid }
      end

      context "with email format" do
        subject{ User.new(skype_name: "umeyuki1111@gmail.com" ) }
        it { is_expected.not_to be_valid }
      end

      context "with space" do
        subject{ User.new(skype_name: "ume yuki" ) }
        it { is_expected.not_to be_valid }
      end

      context "with a double byte character" do
        subject{ User.new(skype_name: "梅雪" ) }
        it { is_expected.not_to be_valid }
      end

      context "start with a sign" do
        subject{ User.new(skype_name: ".umeyuki" ) }
        it { is_expected.not_to be_valid }
      end
    end

  end
end
