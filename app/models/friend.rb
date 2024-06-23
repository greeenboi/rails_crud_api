class Friend < ApplicationRecord
  validates :name, length: { minimum: 2 }
  validates :phone, length: { is: 10 }, numericality: true
  validates :github, length: { minimum: 12,  }
  validate :github_must_have_github
  validates :email, length: { minimum: 2 }
  validate :email_must_have_at_symbol
  validates :hobby, length: { minimum: 5 }
  validates :location, length: { minimum: 2 }

  private

  def email_must_have_at_symbol
    errors.add(:email, "must include @ symbol") unless email.include?("@")
  end

  def github_must_have_github
    errors.add(:github, "must include github.com/") unless github.include?("github.com/")
  end
end
