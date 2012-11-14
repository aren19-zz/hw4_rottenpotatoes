require 'spec_helper'

describe MoviesController do

    describe "Viewing Movies information:" do
        it 'Should find movies with same director when searching for similar movies' do
            current = mock('Movie', :director => "Fake Director")
            similar = [mock('Movie'), mock('Movie')]

            Movie.should_receive(:find).with('42').and_return(current)
            Movie.should_receive(:find_all_by_director).with(current.director).and_return(similar)

            get :similar, { :id => '42' }
        end
        it 'Should redirect to home page if searching similiar movies of a movie without director' do
            movie = mock('Movie', :title => "Fake", :director => nil)

            Movie.stub(:find).and_return(movie)

            get :similar, { :id => '13' }
            response.should redirect_to(movies_path)
        end
    end

    describe 'Creating and Destroying Movies:' do
        it 'Should be possible to create new movies' do
            movie = mock('Movie', :title => "Fake")

            Movie.should_receive(:create!).and_return(movie)

            post :create, { :movie => movie }
        end
        it 'Should possible to destroy stored movies' do
            movie = mock('Movie', :title => "Fake")

            Movie.should_receive(:find).with('42').and_return(movie)
            movie.should_receive(:destroy)

            post :destroy, { :id => '42' }
        end
    end

    describe 'Editing Movies information:' do
        it 'Should find data of selected movie' do
            Movie.should_receive(:find).with('42')
            get :edit, { :id => '42' }
        end
        it 'Should update data when requested' do
            movie = mock('Movie', :title => "Fake", :director => "Fake Director")
            movie.stub(:update_attributes!)

            Movie.stub(:find).and_return(movie)
            movie.should_receive(:update_attributes!)

            post :update, { :id => '42', :movie => mock('Movie') }
        end
    end

    describe 'Sorting and Filtering Movies:' do
        it 'Should be possible to sort by title' do
            get :index, { :sort => 'title' }
            response.should redirect_to(movies_path(:sort => 'title'))
        end
        it 'Should be possible to sort by release date' do
            get :index, { :sort => 'release_date' }
            response.should redirect_to(movies_path(:sort => 'release_date'))
        end
        it 'Should be possible to filter movies based on ratings' do
            get :index, { :ratings => {:G => 1} }
            response.should redirect_to(movies_path(:ratings => { :G => 1 }))
        end
    end

end
