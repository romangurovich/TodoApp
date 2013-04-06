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

  def nav(klass)
    back_to(klass)
  end

  def back_to(klass)
    controller_name = klass.name.pluralize.underscore
    path = url_for controller: controller_name, action: 'index'
    where = controller_name.gsub(/_/, " ").capitalize

    link_to "Back to #{where}", path
  end

  def undo(object)
    controller_name = object.class.name.pluralize.underscore
    path = url_for controller: controller_name, action: 'index'
    where = controller_name.singularize.gsub(/_/, " ")

    if object.persisted?
      link_to "Perhaps let this #{where} go unchanged?", path
    else
      link_to "Don't really want to make this #{where}?", path
    end
  end

  # def go_back(object, options = {})
#     controller_name = object.class.name.pluralize.underscore
#     path = url_for controller: controller_name, action: 'index'
#     where = controller_name.gsub(/_/, " ")
#
#     if options[:boring] == true
#       link_to ("Back to #{where.capitalize.pluralize}", path)
#       return
#     end
#
#     if object.persisted?
#       link_to "Perhaps let this #{where} go unchanged?", path
#     else
#       link_to "Don't really want to make this #{where}?", path
#     end
#   end
end
