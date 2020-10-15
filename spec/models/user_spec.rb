require 'rails-helper'

RSpec.decribe User, :type => :model do
    it "is valid with proper attributes"
    it "does not save without a username"
    it "does not create duplicate usernames"
    it "does not save without a password"
end