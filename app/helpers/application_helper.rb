module ApplicationHelper
  def index_of_item(current_index, page_size)
    page = params[:page] && params[:page].to_i-1 || 0
    current_index + page*page_size + 1
  end

  def active_for_dir1(dir1)
    'active' if dir1 == @dir1
  end

  def active_for_dir2(dir2)
    'active' if dir2 == @dir2
  end

  def active_for_dir3(dir3)
    'active' if dir3 == @dir3
  end

  def active_for_controllers(*ctrl_names)
    'active' if ctrl_names.include? controller_name
  end

  def active_for_actions(*action_names)
    'active' if action_names.include? action_name
  end

  def yes_or_no(bool)
    t("enum.#{!!bool}_value")
  end
end
