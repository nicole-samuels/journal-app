class Pattern < ApplicationRecord
    enum :level, {beginner: "Beginner", intermediate: "Intermediate", advanced: "Advanced"}

    has_one_attached :pattern_pdf
    has_many :projects

    # Validations
    validates :pattern_name, :description, :item_category, :level, presence:true
    validates :pattern_pdf, content_type: 'application/pdf'
end
