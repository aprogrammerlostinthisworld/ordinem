module ApplicationHelper
  def title(page_title)
      content_for :title,  page_title.to_s
  end
  
  def current_project
    Project.find_by_id(user_session[:current_project_id])
  end
  
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end
  
  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
  
  ### ?????
  
  def flash_msg
    flash.discard
    [flash.notice, flash.alert].compact * '; '
  end
  
  def errors(resource)
    ("<div id='flash'>" << resource.errors.try(:full_messages) * '; ' << '</div>').html_safe if resource.errors.any?
  end
  
  
  def projects_list
    projects = current_user.projects.map do |project|
      s = "<li>"
      # s += link_to project.name, project, :class => (current_page?(project_path project) ? "current" : ''), :id => project.id, :remote => true
      s += link_to "#{(current_page?(project_path project) ? '<i class="icon-chevron-right"></i>' : '')} #{project.name}".html_safe, project,  :id => project.id
      ## s += "<a href=\"#{project_path(project)}\">#{project.name}"
    end.join("</li>\n")
    # projects << [link_to("<li><i class='icon-list'></i>All projects</li>\n".html_safe, projects_path)]
    [projects, link_to("<li><i class=\'icon-plus\'></i>Add project</li>\n".html_safe, new_project_path)].reject(&:blank?).join("<li class='divider'></li>").html_safe
  end
  
  def list(stuff, &block)
    #content_tag(:ul, stuff.map { |thingie| content_tag(:li, yield(thingie)) })
    stuff.map { |thingie| content_tag(:li, yield(thingie))}
  end
end
