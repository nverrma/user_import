class User < ApplicationRecord
  validates :name, presence: true
  validate :strong_password

  def strong_password
    if password.blank?
      errors.add(:base, "Change 10 characters of #{name}'s password")
      return
    end

    count = 0
    unless password.length.in?(10..16)
      length = password.length
      count = length < 10 ? (10 - length) : (length - 16)
    end

    repeating_chars = password.scan(/(\w)\1\1/)
    count += repeating_chars.count if repeating_chars.count.positive?

    count += 1 unless password.match?(/(?=[^a-z]*[a-z])/)
    count += 1 unless password.match?(/(?=[^A-Z]*[A-Z])/)
    count += 1 unless password.match?(/(?=[^0-9]*[0-9])/)

    return if count.zero?

    errors.add(:base, "Change #{ActionController::Base.helpers.pluralize(count, 'character')} of #{name}'s password")
  end
end
