class Pattern < ApplicationRecord
    enum :level, { beginner: "Beginner", intermediate: "Intermediate", advanced: "Advanced"}
end
