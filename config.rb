require 'builder'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "/404.html", :layout => false
page "/sitemap.xml", :layout => false

###
# Helpers
###

# Reload the browser automatically whenever files change
activate :livereload

# Deploy-specific configuration
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :rsync
  deploy.clean  = true
  deploy.host   = "www.wejustdostuff.com"
  deploy.path   = "/var/www/wejustdostuff.com/htdocs"
  deploy.flags  = "-avz --chmod=Dg+s,ug+w,+r -e"
end

###
# Assets
###

set :js_dir, 'assets/js'
set :css_dir, 'assets/css'
set :images_dir, 'assets/img'
set :fonts_dir, 'assets/fonts'

sprockets.append_path File.join "#{root}", "bower_components"

###
# Environments
###

# Development-specific configuration
configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = false
  end
end

# Build-specific configuration
configure :build do
  # cache
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :imageoptim do |options|
    options.pngout_options    = false
    options.advpng_options    = false
  end
  # others
  activate :asset_hash
  activate :favicon_maker
  # analytics
  activate :google_analytics do |ga|
    ga.anonymize_ip = true
    ga.tracking_id = data.site.ga_account
  end
end