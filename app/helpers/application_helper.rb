module ApplicationHelper
  def check_box_field(parent, model_object, display_method)
    parent_name = parent.class.name.underscore
    parent_ids = parent_name + "_ids"

    child_name = model_object.name.underscore
    child_ids = (child_name + "_ids").to_sym

    html = ""

    model_object.all.each do |thing|
      html += "<label>"

      html += check_box_tag(
                        "#{parent_name}[#{child_ids}][]",
                        thing.id,
                        parent.send(child_ids).include?(thing.id),
                      )
      html += thing.send(display_method)
      html += "</label>"
    end

    html += (hidden_field_tag "#{parent_name}[#{child_ids}][]")
    html.html_safe
  end
end
