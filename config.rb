require "extensions/views"

activate :views
activate :directory_indexes

set :relative_links, true
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :layout, "layouts/application"

page '/intro_to_web/example_page.html', directory_index: false
page '/intro_to_web/example_page_with_style.html', directory_index: false
page '/intro_to_web/example_page_with_js.html', directory_index: false
page "/404.html", :directory_index => false, :layout => false # For GH pages

configure :development do
 activate :livereload
end

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.branch = 'master'
end

helpers do
  def nav_link(link_text, page_url, options = {})
    options[:class] ||= ""
    if current_page.url.length > 1
      current_url = current_page.url.chop
    else
      current_url = current_page.url
    end
    options[:class] << " active" if page_url == current_url
    link_to(link_text, page_url, options)
  end

  def signup_url
    "https://www.bridgetroll.org/events/270"
  end

  def event_date
    "December 02&mdash;03, 2016".html_safe
  end

  def address_line_1
    "UNC Chapel Hill Department of Computer Science - Sitterson Hall lobby"
  end

  def address_line_2
    "201 S. Columbia St."
  end

  def address_line_3
    "Chapel Hill NC 27599"
  end
end
