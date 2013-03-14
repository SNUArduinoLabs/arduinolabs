module ApplicationHelper


  def intensity_badge_tag(difficulty)
    return unless difficulty

    class_name = case difficulty
                 when 1 then 'info'
                 when 2 then 'success'
                 when 3 then 'important'
                 end
    content_tag :span, difficulty, class: "badge badge-#{class_name}"
  end

  def number_badge(num)
    return unless num

    content_tag :span, num, class: "badge badge-success"
  end

end
