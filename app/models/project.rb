class Project < ApplicationRecord
    belongs_to :pattern
    has_many_attached :photo

    scope :active, -> { where(status: :in_progress) }

    validates :total_price, :yarn_price, :yarn_quantity, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

    validates :purchase_link, url: true, allow_blank: true

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

        enum :needle_size, {
        us_0: "US 0 - 2.0 mm",
        us_1: "US 1 - 2.25 mm",
        us_2: "US 2 - 2.75 mm",
        us_3: "US 3 - 3.25 mm",
        us_4: "US 4 - 3.5 mm",
        us_5: "US 5 - 3.75 mm",
        us_6: "US 6 - 4.0 mm",
        us_7: "US 7 - 4.5 mm",
        us_8: "US 8 - 5.0 mm",
        us_9: "US 9 - 5.5 mm",
    }


    def total_price
        yarn_price.to_f * yarn_quantity.to_f
    end

     def average_review
       reviews = [project_difficulty_review, yarn_softness_review, pattern_clarity_review].map(&:to_f)

       reviews.sum / reviews.size

    end

end
