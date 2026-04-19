# app/models/inspiration_resource.rb
class InspirationResource < ApplicationRecord
  validates :title, :url, :category, presence: true
  
  CATEGORIES = [
    # Conducting & Direction
    "Conducting Technique",
    "Gesture & Body Language",
    
    # Music & Sound
    "Music Theory",
    "Music History",
    "Emotion in Music",
    "Rhythm & Tempo",
    # Performance & Choreography
    "Dance & Movement",
    "Choreography",
    "Performance Art",
    # Staging & Technical
    "Stage Lighting",
    "Stage Design",
    "Sound Engineering",
    "Projection & Video",
    # Visual & Aesthetic
    "Visual Design",
    "Color & Composition",
    "Photography & Cinematography",
    
    # Emotional & Philosophical
    "Storytelling",
    "Emotion & Psychology",
    "Audience Engagement"
  ]
    validates :category, inclusion: { in: CATEGORIES }

  def listcategories
    CATEGORIES
  end
end
