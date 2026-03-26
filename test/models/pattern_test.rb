require "test_helper"

class PatternTest < ActiveSupport::TestCase
  
  test "should not save pattern without pattern name" do
    pattern = Pattern.new(
      description: "Some description",
      item_category: "Hat",
      level: "Beginner"
    )
  assert_not(pattern.save,"Saved pattern without pattern name")
  assert_includes pattern.errors[:pattern_name], "can't be blank"
end
  
  test "should be valid pattern with all required fields" do
    pattern = Pattern.new(
      pattern_name: "Hat Pattern",
      description: "Some description",
      item_category: "Hat",
      level: "Beginner"
    )
    assert pattern.valid?
  end

  test "should not allow non-pdf file types" do
    pattern = Pattern.new(
      pattern_name: "Sophie Scarf",
      description: "Testing invalid uploads",
      item_category: "Scarf",
      level: "Beginner"
    )

    # Attach an image instead of an image
    pattern.pattern_pdf.attach(
      io: File.open(Rails.root.join('test/fixtures/files/screenshot.png')),
      filename: 'screenshot.png',
      content_type: 'image/png'
    )

    assert_not pattern.valid?, "Pattern should be invalid with an image file"
  end

    test "should allow pdf file types" do
    pattern = Pattern.new(
      pattern_name: "Sophie Scarf",
      description: "Testing invalid uploads",
      item_category: "Scarf",
      level: "Beginner"
    )

    # Attach an pdf instead of an image
    pattern.pattern_pdf.attach(
      io: File.open(Rails.root.join('test/fixtures/files/sophiehood.pdf')),
      filename: 'sophiehood.pdf',
      content_type: 'application/pdf'
    )

    assert pattern.valid?, "Pattern should be valid with a pdf file"
  end
  
  # test "the truth" do
  #   assert true
  # end
end
