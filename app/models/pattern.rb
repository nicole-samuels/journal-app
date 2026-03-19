class Pattern < ApplicationRecord
    enum :level, {beginner: "Beginner", intermediate: "Intermediate", advanced: "Advanced"}

    has_one_attached :pattern_pdf
end
