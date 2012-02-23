require 'spec_helper'

describe MoviesController do
  describe 'add director' do
    it 'should select the Edit template for rendering' do
    end
    it 'should select the Show template for rendering' do
      #post :create, {:controller => "movies", :movies => {"title"=>"Alien", "rating"=>"R", "director"=>"Ridley Scott"}}
      #post :update, {:controller => "movies", :id => 1}
      #response.should render_template('show')
    end
    it 'should make the director results available to that template' do   
      #post :update, {:movies => {"title"=>"Alien", "rating"=>"R", "director"=>"Ridley Scott"}}
      #assigns(:movies).should == {"title"=>"Alien", "rating"=>"R", "director"=>"Ridley Scott"}
      end
  end
  describe 'happy path' do
    before :each do
      @fake_results = [mock('Movie'), mock('Movie')]
    end
    
    it 'should select the Show template for rendering' do
    end
    it 'should call the model method that finds similar movies' do
      #Movie.should_receive(:similar_directors).with('George Lucas').and_return(@fake_results)
      #post :similar, {:controller => "movies", :movie_id => "1"}
    end
    it 'should select the Similar template for rendering' do
    end
    it 'should make the similar movie results available to that template' do
    end
  end
  describe 'sad path' do
    it 'should select the Show template for rendering' do
    end
    it 'should select the Index template for rendering' do
    end
  end
end
