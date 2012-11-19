module ApplicationHelper
  def active_page(arr)
      if arr.any? { |page| current_page?(page) }
        raw "class='active'"
      end
    end
end
