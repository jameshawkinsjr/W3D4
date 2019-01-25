# This file should contain all the record creation needed to seed 
# the database with its default values.
# The data can then be loaded with the rails db:seed command 
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, 
#                          { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all

  jane = User.create!({username: "Jane"})
  sara = User.create!({username: "sara88"})
  billy = User.create!({username: "Billy"})
  tom = User.create!({username: "Tom"})

  Poll.destroy_all

  fav_movies = Poll.create!({title: "Your Favorite Movies", author_id: tom.id})
  why_goats = Poll.create!({title: "Why Goats?", author_id: sara.id})
  how_many_fingers = Poll.create!({title: "How Many Fingers?", author_id: billy.id})
  flat_earth = Poll.create!({title: "Round Earth!?", author_id: jane.id})
  average_speed = Poll.create!({title: "Human Speed", author_id: billy.id})

  Question.destroy_all

  movie_q1 = Question.create!({body: "What's your favorite movie?", poll_id: fav_movies.id})
  goats_q1 = Question.create!({body: "Why are baby goats called kids?", poll_id: why_goats.id})
  fingers_q1 = Question.create!({body: "How many fingers are in this room?", poll_id: how_many_fingers.id})
  earth_q1 = Question.create!({body: "How can you believe the Earth is round?", poll_id: flat_earth.id})
  speed_q1 = Question.create!({body: "What is the average speed of all the humans on Earth?", poll_id: average_speed.id})
  
  movie_q2 = Question.create!({body: "What's your second favorite movie?", poll_id: fav_movies.id})
  goats_q2 = Question.create!({body: "Why are male goats called Billys?", poll_id: why_goats.id})
  fingers_q2 = Question.create!({body: "Do you think the number is the same as toes?", poll_id: how_many_fingers.id})
  earth_q2 = Question.create!({body: "NASA faked the moon landing.", poll_id: flat_earth.id})
  speed_q2 = Question.create!({body: "Do you think it's changed since you've finished reading this question?", poll_id: average_speed.id})

  AnswerChoice.destroy_all

  movie_q1_a1 = AnswerChoice.create!({choice_body: "Forrest Gump", question_id: movie_q1.id})
  movie_q1_a2 = AnswerChoice.create!({choice_body: "Ratatouille", question_id: movie_q1.id})
  movie_q2_a1 = AnswerChoice.create!({choice_body: "The Rugrats Movie", question_id: movie_q2.id})
  movie_q2_a2 = AnswerChoice.create!({choice_body: "The Hangover", question_id: movie_q2.id})
  
  goats_q1_a1 = AnswerChoice.create!({choice_body: "Because they are young", question_id: goats_q1.id})
  goats_q1_a2 = AnswerChoice.create!({choice_body: "Because that's what young humans are called", question_id: goats_q1.id})
  goats_q2_a1 = AnswerChoice.create!({choice_body: "The person who founded them was named William", question_id: goats_q2.id})
  goats_q2_a2 = AnswerChoice.create!({choice_body: "Who asks that?", question_id: goats_q2.id})
  
  fingers_q1_a1 = AnswerChoice.create!({choice_body: "819", question_id: fingers_q1.id})
  fingers_q1_a2 = AnswerChoice.create!({choice_body: "Probably as many as there are toes", question_id: fingers_q1.id})
  fingers_q2_a1 = AnswerChoice.create!({choice_body: "No", question_id: fingers_q2.id})
  fingers_q2_a2 = AnswerChoice.create!({choice_body: "Yes", question_id: fingers_q2.id})
  
  earth_q1_a1 = AnswerChoice.create!({choice_body: "Why stop at flat", question_id: earth_q1.id})
  earth_q1_a2 = AnswerChoice.create!({choice_body: "Science", question_id: earth_q1.id})
  earth_q2_a1 = AnswerChoice.create!({choice_body: "That's not even a AnswerChoice.", question_id: earth_q2.id})
  earth_q2_a2 = AnswerChoice.create!({choice_body: "Yes they did.", question_id: earth_q2.id})
  
  speed_q1_a1 = AnswerChoice.create!({choice_body: "0.8 mph", question_id: speed_q1.id})
  speed_q1_a2 = AnswerChoice.create!({choice_body: "Walking speed", question_id: speed_q1.id})
  speed_q2_a1 = AnswerChoice.create!({choice_body: "Depends on the degree of accuracy.", question_id: speed_q2.id})
  speed_q2_a2 = AnswerChoice.create!({choice_body: "They're relatively similar, on a global scale.", question_id: speed_q2.id})

  Response.destroy_all

  movie_q1_a1_r1 = Response.create!({choice_id: movie_q1_a1.id, user_id: jane.id}) 
  movie_q1_a2_r2 = Response.create!({choice_id: movie_q1_a2.id, user_id: sara.id}) 
  movie_q2_a1_r1 = Response.create!({choice_id: movie_q2_a1.id, user_id: billy.id}) 
  movie_q2_a2_r2 = Response.create!({choice_id: movie_q2_a2.id, user_id: jane.id}) 
  goats_q1_a1_r1 = Response.create!({choice_id: goats_q1_a1.id, user_id: tom.id}) 
  goats_q1_a2_r2 = Response.create!({choice_id: goats_q1_a2.id, user_id: sara.id}) 
  goats_q2_a1_r1 = Response.create!({choice_id: goats_q2_a1.id, user_id: jane.id}) 
  goats_q2_a2_r2 = Response.create!({choice_id: goats_q2_a2.id, user_id: sara.id}) 
  fingers_q1_a1_r1 = Response.create!({choice_id: fingers_q1_a1.id, user_id: billy.id}) 
  fingers_q1_a2_r2 = Response.create!({choice_id: fingers_q1_a2.id, user_id: jane.id}) 
  fingers_q2_a1_r1 = Response.create!({choice_id: fingers_q2_a1.id, user_id: tom.id}) 
  fingers_q2_a2_r2 = Response.create!({choice_id: fingers_q2_a2.id, user_id: sara.id}) 
  earth_q1_a1_r1 = Response.create!({choice_id: earth_q1_a1.id, user_id: tom.id}) 
  earth_q1_a2_r2 = Response.create!({choice_id: earth_q1_a2.id, user_id: sara.id}) 
  earth_q2_a1_r1 = Response.create!({choice_id: earth_q2_a1.id, user_id: tom.id}) 
  earth_q2_a2_r2 = Response.create!({choice_id: earth_q2_a2.id, user_id: jane.id}) 
  speed_q1_a1_r1 = Response.create!({choice_id: speed_q1_a1.id, user_id: jane.id}) 
  speed_q1_a2_r2 = Response.create!({choice_id: speed_q1_a2.id, user_id: tom.id}) 
  speed_q2_a1_r1 = Response.create!({choice_id: speed_q2_a1.id, user_id: sara.id}) 
  speed_q2_a2_r2 = Response.create!({choice_id: speed_q2_a2.id, user_id: jane.id}) 
  
  movie_q1_a1_r1 = Response.create!({choice_id: movie_q1_a1.id, user_id: billy.id}) 
  movie_q1_a2_r2 = Response.create!({choice_id: movie_q1_a2.id, user_id: tom.id}) 
  movie_q2_a1_r1 = Response.create!({choice_id: movie_q2_a1.id, user_id: sara.id}) 
  movie_q2_a2_r2 = Response.create!({choice_id: movie_q2_a2.id, user_id: billy.id}) 
  goats_q1_a1_r1 = Response.create!({choice_id: goats_q1_a1.id, user_id: jane.id}) 
  goats_q1_a2_r2 = Response.create!({choice_id: goats_q1_a2.id, user_id: tom.id}) 
  goats_q2_a1_r1 = Response.create!({choice_id: goats_q2_a1.id, user_id: billy.id}) 
  goats_q2_a2_r2 = Response.create!({choice_id: goats_q2_a2.id, user_id: tom.id}) 
  fingers_q1_a1_r1 = Response.create!({choice_id: fingers_q1_a1.id, user_id: sara.id}) 
  fingers_q1_a2_r2 = Response.create!({choice_id: fingers_q1_a2.id, user_id: billy.id}) 
  fingers_q2_a1_r1 = Response.create!({choice_id: fingers_q2_a1.id, user_id: jane.id}) 
  fingers_q2_a2_r2 = Response.create!({choice_id: fingers_q2_a2.id, user_id: tom.id}) 
  earth_q1_a1_r1 = Response.create!({choice_id: earth_q1_a1.id, user_id: jane.id}) 
  earth_q1_a2_r2 = Response.create!({choice_id: earth_q1_a2.id, user_id: tom.id}) 
  earth_q2_a1_r1 = Response.create!({choice_id: earth_q2_a1.id, user_id: jane.id}) 
  earth_q2_a2_r2 = Response.create!({choice_id: earth_q2_a2.id, user_id: billy.id}) 
  speed_q1_a1_r1 = Response.create!({choice_id: speed_q1_a1.id, user_id: billy.id}) 
  speed_q1_a2_r2 = Response.create!({choice_id: speed_q1_a2.id, user_id: jane.id}) 
  speed_q2_a1_r1 = Response.create!({choice_id: speed_q2_a1.id, user_id: tom.id}) 
  speed_q2_a2_r2 = Response.create!({choice_id: speed_q2_a2.id, user_id: billy.id}) 
end
