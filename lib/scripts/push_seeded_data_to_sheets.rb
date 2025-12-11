require 'google_drive'

def push_seeded_data
  # Note: This script assumes you have CommunityIdea records in the database
  # and want to push them to Google Sheets for backup/analysis

  session = GoogleDrive::Session.from_service_account_key(ENV['GOOGLE_SERVICE_ACCOUNT_JSON_PATH'])
  spreadsheet = session.spreadsheet_by_title("Timiza")

  if spreadsheet.nil?
    puts "Error: Could not find spreadsheet 'Timiza'"
    return
  end

  # Create or get worksheet for community ideas
  sheet = spreadsheet.worksheet_by_title("CommunityIdeas")
  if sheet.nil?
    sheet = spreadsheet.add_worksheet("CommunityIdeas")
    # Add headers
    sheet[1, 1] = "Title"
    sheet[1, 2] = "Description"
    sheet[1, 3] = "Ward"
    sheet[1, 4] = "Topic"
    sheet[1, 5] = "Upvotes"
    sheet[1, 6] = "Downvotes"
    sheet[1, 7] = "Created At"
  end

  # Get existing data to avoid duplicates
  existing_titles = sheet.rows[2..-1].map { |row| row[0] } # Skip header

  CommunityIdea.all.each do |idea|
    next if existing_titles.include?(idea.title)

    # Find next empty row
    next_row = sheet.num_rows + 1

    sheet[next_row, 1] = idea.title
    sheet[next_row, 2] = idea.description
    sheet[next_row, 3] = idea.ward
    sheet[next_row, 4] = idea.topic
    sheet[next_row, 5] = idea.upvotes
    sheet[next_row, 6] = idea.downvotes
    sheet[next_row, 7] = idea.created_at.to_s
  end

  sheet.save
  puts "Successfully pushed #{CommunityIdea.count} community ideas to Google Sheets"
end

# Run the script
push_seeded_data