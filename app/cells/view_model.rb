class ViewModel < Cell::ViewModel
  include AbstractController::Helpers
  include AbstractController::Translation
  include Devise::Controllers::Helpers
  include ApplicationHelper
end
