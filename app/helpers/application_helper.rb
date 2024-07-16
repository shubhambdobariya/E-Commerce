module ApplicationHelper

  def return_error_class(key)
    case key
    when 'success'
      'success'
    when 'notice'
      'success'
    when 'alert'
      'danger'
    when 'error'
      'danger'
    else
      ' '
    end
  end
end
