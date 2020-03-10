require 'rails_helper'

describe MovieController do

    describe "#Edit" do
        # Fetche the db object and render template 
        it "Fetche the movie for edit" do
            @movie = double("Test movie", :id =>"10")
            @movie_id = "10"
            expect(Movie).to_receive(:find).with(@movie_id).and_return(@movie)
            get :edit, {:id => @movie_id}
            expect(response).to render_template(:edit)
        end

    end
end

