module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end


  def ld(d)
    I18n.l(d) unless d.nil?
  end  


  def show_icon
    content_tag(:span,"",class: "glyphicon glyphicon-folder-open")
  end

  def exclaim_icon
    content_tag(:span,"",class: "glyphicon glyphicon-exclamation-sign")
  end

  def eye_open_icon(id)
    content_tag(:span,"",class: "glyphicon glyphicon-eye-open",id: id)
  end  

   def eye_close_icon(id)
    content_tag(:span,"",class: "glyphicon glyphicon-eye-close",id: id)
  end  

  def edit_icon
    content_tag(:span,"",class: "glyphicon glyphicon-edit")
  end

  def del_icon
    content_tag(:span,"",class: "glyphicon glyphicon-trash")
  end

  def arrow_up_icon
    content_tag(:span,"",class: "glyphicon glyphicon-arrow-up")
  end


  def red_label(s)
    content_tag(:span,s,class: "label label-danger")
  end

  def jury_icon
    content_tag(:span,"",class: "glyphicon glyphicon-tower")
  end


  def nomination_icon
    content_tag(:span,"",class: "glyphicon glyphicon-book")
  end  

end
