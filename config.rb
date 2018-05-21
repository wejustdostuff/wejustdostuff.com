# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :sprockets

activate :search_engine_sitemap

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :google_analytics do |ga|
  ga.anonymize_ip = true
  ga.tracking_id = data.site.ga_account
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.txt', layout: false
page '/*.json', layout: false
page "/404.html", layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Assets

set :js_dir, 'assets/js'
set :css_dir, 'assets/css'
set :images_dir, 'assets/img'
set :fonts_dir, 'assets/fonts'
set :url_root, @app.data.site.url

sprockets.append_path File.join "#{root}", "bower_components"

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
	# robots.txt
	activate :robots,
		:rules => [
	    {:user_agent => '*', :allow => %w(/)}
		],
		:sitemap => "#{@app.data.site.url}/sitemap.xml"
  # cache
  activate :imageoptim
  activate :minify_css
  activate :minify_html
  activate :cache_buster
  activate :minify_javascript
  # favicon
  activate :favicon_maker do |f|
    f.template_dir = "source/assets/img"
    f.icons = {
      "favicon.png" => [
        { icon: "apple-touch-icon-152x152-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for retina iPad with iOS7.
        { icon: "apple-touch-icon-144x144-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for retina iPad with iOS6 or prior.
        { icon: "apple-touch-icon-120x120-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for retina iPhone with iOS7.
        { icon: "apple-touch-icon-114x114-precomposed.png" },             # Same as apple-touch-icon-57x57.png, for retina iPhone with iOS6 or prior.
        { icon: "apple-touch-icon-76x76-precomposed.png" },               # Same as apple-touch-icon-57x57.png, for non-retina iPad with iOS7.
        { icon: "apple-touch-icon-72x72-precomposed.png" },               # Same as apple-touch-icon-57x57.png, for non-retina iPad with iOS6 or prior.
        { icon: "apple-touch-icon-60x60-precomposed.png" },               # Same as apple-touch-icon-57x57.png, for non-retina iPhone with iOS7.
        { icon: "apple-touch-icon-57x57-precomposed.png" },               # iPhone and iPad users can turn web pages into icons on their home screen. Such link appears as a regular iOS native application. When this happens, the device looks for a specific picture. The 57x57 resolution is convenient for non-retina iPhone with iOS6 or prior. Learn more in Apple docs.
        { icon: "apple-touch-icon-precomposed.png", size: "57x57" },      # Same as apple-touch-icon.png, expect that is already have rounded corners (but neither drop shadow nor gloss effect).
        { icon: "apple-touch-icon.png", size: "57x57" },                  # Same as apple-touch-icon-57x57.png, for "default" requests, as some devices may look for this specific file. This picture may save some 404 errors in your HTTP logs. See Apple docs
        { icon: "favicon-196x196.png" },                                  # For Android Chrome M31+.
        { icon: "favicon-160x160.png" },                                  # For Opera Speed Dial (up to Opera 12; this icon is deprecated starting from Opera 15), although the optimal icon is not square but rather 256x160. If Opera is a major platform for you, you should create this icon yourself.
        { icon: "favicon-96x96.png" },                                    # For Google TV.
        { icon: "favicon-32x32.png" },                                    # For Safari on Mac OS.
        { icon: "favicon-16x16.png" },                                    # The classic favicon, displayed in the tabs.
        { icon: "favicon.png", size: "16x16" },                           # The classic favicon, displayed in the tabs.
        { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },         # Used by IE, and also by some other browsers if we are not careful.
        { icon: "mstile-70x70.png", size: "70x70" },                      # For Windows 8 / IE11.
        { icon: "mstile-144x144.png", size: "144x144" },
        { icon: "mstile-150x150.png", size: "150x150" },
        { icon: "mstile-310x310.png", size: "310x310" },
        { icon: "mstile-310x150.png", size: "310x150" }
      ]
    }
  end
end

configure :development do
	activate :livereload
end

activate :deploy do |deploy|
  activate :gh_pages do |gh_pages|
    gh_pages.remote = 'git@github.com:wejustdostuff/wejustdostuff.com.git'
  end
end
