# == Schema Information
#
# Table name: responses
#
#  id         :bigint(8)        not null, primary key
#  choice_id  :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  validate :answer_own_question?
  validate :respondent_already_answered?

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    siblings = self.sibling_responses
    # return true if siblings.exists?(user_id: self.user_id)

    errors[:repeat_response] << "You've already responded, you son of a '%'!" if siblings.exists?(user_id: self.user_id)

    # siblings.each do |s|
    #   return true if s.user_id == self.user_id
    # end
  end

  def answer_own_question?
    poll_author = self.poll.author_id
    errors[:answer_own_question] << "You created this poll, you son of a '%'!" if poll_author = self.user_id
  end

end
