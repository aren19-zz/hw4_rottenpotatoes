require 'spec_helper'

describe MoviesHelper do
    describe '#oddness' do
        it 'Should return "odd" given an odd number'do
            helper.oddness(1).should eq("odd")
            helper.oddness(3).should eq("odd")
            helper.oddness(5).should eq("odd")
        end
        it 'Should return "even" given an even number' do
            helper.oddness(2).should eq("even")
            helper.oddness(4).should eq("even")
            helper.oddness(6).should eq("even")
        end
    end
end
