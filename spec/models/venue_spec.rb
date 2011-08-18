require 'spec_helper'

describe Venue do
	it { should reference_many(:feedback).with_foreign_key(:venue_id) }      
end
