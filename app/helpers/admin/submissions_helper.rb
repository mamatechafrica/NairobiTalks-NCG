module Admin::SubmissionsHelper
	STATUS_COLOR_CLASSES = {
		submitted: "bg-secondary",
		under_review: "bg-info",
		reviewed: "bg-primary",
		approved: "bg-success",
		rejected: "bg-danger"
	}.freeze

	STEP_STATES = {
		completed: "status-pill-completed",
		current: "status-pill-current",
		pending: "status-pill-pending"
	}.freeze

	def admin_submission_stepper(submission)
		steps = CitizenSubmission::REVIEW_STEPS
		current_label = submission.status_label
		current_index = steps.index(current_label) || 0

		content_tag(:div, class: "d-flex gap-1 review-stepper", role: "presentation") do
			steps.each_with_index.map do |label, index|
				state = if index < current_index
									:completed
								elsif index == current_index
									:current
								else
									:pending
								end
				status_key = CitizenSubmission::STATUS_LABELS.key(label)
				status_class = status_key ? STATUS_COLOR_CLASSES[status_key] : ""
				classes = "flex-fill text-center small px-2 py-1 rounded #{STEP_STATES[state]} #{status_class}"
				content_tag(:div, label, class: classes.strip, title: label)
			end.join.html_safe
		end
	end

	def status_badge_class(submission)
		status_key = submission.status.to_sym
		STATUS_COLOR_CLASSES[status_key] || "status-pill-default"
	end
end
