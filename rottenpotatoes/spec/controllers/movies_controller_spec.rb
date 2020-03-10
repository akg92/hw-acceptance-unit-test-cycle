require 'rails_helper'
# require 'byebug'

describe MoviesController do

    describe "#Edit" do
        # Fetche the db object and render template 
        it "Fetch the movie for edit" do
            @movie = double("Test movie", :id =>"10")
            @movie_id = "10"
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            get :edit, {:id => @movie_id}
            expect(response).to render_template(:edit)
        end

    end
    ## Find similar director
    describe "Director" do
        fit "Find movies with same director" do
            movies = [ double("Movie 1", :id => "1", :director => "director", :title => 'Title 1'), double("Movie 2", :id => "2", :director => "director", :title => 'Title 2')]
            id = "1" 
            movie_2_title = "Movie 2"
            allow(Movie).to receive(:find_director_other_movie).and_return(movies)
            # expect(Movie).to receive(:find_director).with(id).and_return("director")
            # expect(Movie).to receive(:find).with(id).and_return(movies[0])
            get :director, {:id => id}
            expect(response).to render_template(:director)
        end 
    end
end



