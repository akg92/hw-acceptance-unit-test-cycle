# require 'byebug'
class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  ## find director of movie from id
  def self.find_director(id)
    return Movie.find(id).director
  end

  def self.find_director_other_movie(id)
    director = find_director(id)
    # byebug
    # if director is empty
    if director.empty?
      return nil
    else
      return Movie.where(:director => director)
    end
  end

end
