class Admin::MenuComponent < ApplicationComponent; end

require_dependency Rails.root.join("app", "components", "admin", "menu_component").to_s

class Admin::MenuComponent
  def links
    [
      (proposals_link if feature?(:proposals)),
      (debates_link if feature?(:debates)),
      comments_link,
      # (polls_link if feature?(:polls)),
      (legislation_link if feature?(:legislation)),
      (budgets_link if feature?(:budgets)),
      booths_links,
      (signature_sheets_link if feature?(:signature_sheets)),
      messages_links,
      site_customization_links,
      moderated_content_links,
      profiles_links,
      stats_link,
      settings_links,
      dashboard_links,
      (machine_learning_link if ::MachineLearning.enabled?)
    ]
  end
end
