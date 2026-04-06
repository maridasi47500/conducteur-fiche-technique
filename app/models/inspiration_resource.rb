# app/models/inspiration_resource.rb
class InspirationResource < ApplicationRecord
  validates :title, :url, :category, presence: true
  
  CATEGORIES = [
    "Dance & Movement",
    "Stage Lighting",
    "Music Theory",
    "Conducting Technique",
    "Emotion in Performance",
    "Music History",
    "Visual Design"
  ]
end
