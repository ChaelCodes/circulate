module ApplicationHelper
  # Assume that any request with an action of new or edit is displaying a form
  def form_request?
    %w[new edit].include? params[:action]
  end

  def portal(tag_name: "div", attributes: {}, &block)
    attrs = attributes.deep_merge({
      data: {
        controller: "portal",
        action: "ajax:error->portal#replaceContent ajax:success->portal#replaceContent"
      }
    })
    tag.send(tag_name, **attrs, &block)
  end

  def navbar_link_to(text, link, **options)
    tag.li(class: "nav-item") do
      link_to(text, link, class: "btn btn-link #{options.delete(:class)}", **options)
    end
  end
end
