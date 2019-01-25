def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie.select(:id, :title, :yr, :score)
    .where("yr BETWEEN 1980 AND 1989 AND score BETWEEN 3 AND 5")
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie.select(:yr)
    .where.not(yr: Movie.select(:yr).where("score > 8"))
    .group(:yr)
    .pluck(:yr)
    # .where("yr not in (select yr from movies where score > 8)")
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor.select(:id, :name)
      .joins(:movies)
      .where(movies: {title: title})
      .order("castings.ord")
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  # is there a better syntax?
  Movie.select(:id, :title, "actors.name")
       .joins(:actors)
       .where(castings: {ord: 1})
       .where("director_id = castings.actor_id")
      #  .where("director_id = castings.actor_id AND castings.ord = 1")
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

  # WHY DOES COUNT SHOW?
  Actor.select(:id, :name, "COUNT(*) as roles")
       .joins(:castings)
       .where("castings.ord > 1")
       .group(:id, :name)
       .order("COUNT(*) desc")
       .limit(2)
end
