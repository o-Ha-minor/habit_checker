module ApplicationHelper
  def primary_link_classes
    "inline-block my-1 px-3 py-2 bg-blue-500 rounded-md text-white hover:bg-blue-800 cursor-pointer transition-all duration-300"
  end

  def primary_link_to(name, path, **options)
    options[:class] = [ primary_link_classes, options[:class] ].compact.join(" ")
    link_to name, path, **options
  end

  def primary_submit(form, label = "送信", **options)
    options[:class] = [ primary_link_classes, options[:class] ].compact.join(" ")
    form.submit label, **options
  end
end
