class Project < ApplicationRecord
    belongs_to :pattern

    enum :status, {
        completed: "Completed", 
        in_progress: "In Progress",
        not_started: "Not Started",
        frogged: "Frogged"}
    enum :yarn_weight, {
        thread: "Thread",
        cobweb: "Cobweb / 1 ply:",
        lace: "Lace / 2 ply",
        fingering: "Fingering / 4ply",
        dk: "DK / 8 ply",
        worsted: "Worsted 10 ply",
        aran: "Aran 10 ply",
        bulky: "Bulky 12 ply",
        super_bulky: "Super Bulky (5-6 wpi)",
    }


    def total_price
        yarn_price.to_f * yarn_quantity.to_f
    end

     def average_review
       reviews = [project_difficulty_review, yarn_softness_review, pattern_clarity_review].map(&:to_f)

       reviews.sum / reviews.size

    end

end
