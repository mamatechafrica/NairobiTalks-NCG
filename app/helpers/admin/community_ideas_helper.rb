module Admin::CommunityIdeasHelper
  STATUS_BADGES = {
    "pending" => "bg-warning text-dark",
    "approved" => "bg-success",
    "rejected" => "bg-danger"
  }.freeze

  def community_idea_status_badge(idea)
    status_key = idea.status.to_s.presence&.to_sym
    css_class = STATUS_BADGES[idea.status] || "bg-secondary"
    status_label = CommunityIdea::STATUSES[status_key] || idea.status.to_s.titleize

    content_tag(:span, status_label, class: "status-badge badge #{css_class}")
  end
end
