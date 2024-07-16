module DevelopersHelper
    def project_checkboxes(projects)
      html = ''
      projects.each_slice(2) do |project_pair|
        html += content_tag(:div, class: 'row mt-3') do
          project_pair.map do |project|
            content_tag(:div, class: 'col-md-6') do
              content_tag(:label, class: 'form-check-label') do
                check_box_tag('developer[project_ids][]', project.id, @developer.projects.include?(project), class: 'form-check-input') +
                project.project_name
              end
            end
          end.join.html_safe
        end
      end
      html.html_safe
    end
end
  