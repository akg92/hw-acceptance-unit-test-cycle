require 'rails_helper'

describe Movie do
    describe "Find" do 
        it "Find movie with same director" do 
            title = 'The Terminator' 
            title_same_dir = 'Avatar'

            movie = Movie.where(:title => title).first
            all_other = Movie.find_director_other_movie(movie.id)
            expect(all_other.map {|x| x.title} ).to include(title_same_dir)
        end
    end

end