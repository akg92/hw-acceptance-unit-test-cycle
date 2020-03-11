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
    # Find similar director
    describe "Director" do
        it "Find movies with same director" do
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

    # movie display
    describe "#Show" do
        it "Show does db query on find" do
            expect(Movie).to receive(:find).with("1")
            get :show, {:id => "1"}
        end

        it "Show does template rendering" do
            movie = double("Movie Double", :id => "1")
            expect(Movie).to receive(:find).with("1").and_return(movie)
            get :show, {:id => "1"}
            expect(response).to render_template(:show)
        end
    end


    # movies display
    describe "#Index" do
        it "Index does template rendering" do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "#Create" do
        
        it "Create with valid parameter should call create db" do
            movie_params = {
                :title => "Title1",
                :rating => 'PG-1',
                :director => 'Director',
                :description => 'Description',
                :release_date => DateTime.current.to_date
            }
            movie = double("Movie Double", :title => movie_params[:title])
            expect(Movie).to receive(:create!).and_return(movie)
            post :create, :movie => movie_params
        end


        it "Create with valid parameter should redirect to index" do
            movie_params = {
                :title => "Title1",
                :rating => 'PG-1',
                :director => 'Director',
                :description => 'Description',
                :release_date => DateTime.current.to_date
            }
            movie = double("Movie Double", :title => movie_params[:title])
            # expect(Movie).not_to receive(:create!).and_return(movie)
            post :create, :movie => movie_params
            expect(response.status).to eq(302)
        end
    end

    describe "#New" do 
        it "Check the template rendering" do
            get :new 
            expect(response).to render_template :new    
        end
    end

    describe "#Update" do
        it "Should update movie in the database" do
            movie_id = "123"
            movie = double("Movie",:title => "random")
            params = {:title => "random",:rating => "R", :director => "random"}
            expect(Movie).to receive(:find).with(movie_id).and_return(movie)
            expect(movie).to receive(:update_attributes!).and_return(nil)
            get :update, {:id => movie_id, :movie => params}
            expect(response).to redirect_to(movie_path(movie))
        end
    end

    describe "#Destroy" do
        it "Should delete the movie" do
            movie_id = "123"
            movie = double("Movie",:title => "random")
            expect(Movie).to receive(:find).with(movie_id).and_return(movie)
            expect(movie).to receive(:destroy)
            delete :destroy, :id => movie_id
        end
    end


end



