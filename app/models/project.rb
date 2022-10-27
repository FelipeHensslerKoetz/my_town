class Project < ApplicationRecord
  include AASM

  belongs_to :post

  aasm(:status) do 
    state :pending, initial: true
    state :processing, :canceled, :completed

    event :process do
      transitions from: :pending, to: :processing
    end

    event :cancel do
      transitions from: [:pending, :processing], to: :canceled
    end

    event :complete do
      transitions from: [:pending, :processing], to: :completed
    end
  end
end
