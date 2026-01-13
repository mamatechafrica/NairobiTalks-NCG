When("I visit the community idea page for {string}") do |title|
  idea = CommunityIdea.find_by(title: title)
  visit community_idea_path(idea)
end

When("I post a comment {string}") do |comment_body|
  post_button = find_button('Post')
  form = post_button.find(:xpath, './ancestor::form[1]')
  within(form) do
    find('textarea[name="comment[body]"]').set(comment_body)
    click_button 'Post'
  end
end
