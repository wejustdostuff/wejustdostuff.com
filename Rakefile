
namespace :release do
  desc "Tag, commit and push patch release"
  task :patch do
  end

  desc "Tag, commit and push minor release"
  task :minor do
  end

  desc "Tag, commit and push major release"
  task :major do
  end

  def git_tag
    system "git add . && git commit -am 'Version #{get_config['version']}' && git tag v#{get_config['version']} -m 'Release v#{get_config['version']}'"
  end

  def git_push
    system "git push origin master --tags"
  end

  def get_config
    YAML::load(File.open("./data/site.yml"))
  end

  def set_config (config)
    File.open("./data/site.yml", "w") do |f|
      f.write(config.to_yaml)
    end
  end

  def bump_patch(version)
    version = version.split(".")
    version[2] = version[2].to_i + 1
    version.join(".")
  end

  def bump_minor(version)
    version = version.split(".")
    version[2] = 0
    version[1] = version[1].to_i + 1
    version.join(".")
  end

  def bump_major(version)
    version = version.split(".")
    version[2] = 0
    version[1] = 0
    version[0] = version[0].to_i + 1
    version.join(".")
  end
end

desc "Generate build and deploy to server"
task :deploy do
  system "bundle exec middleman deploy"
end

desc "Build and start server"
task :default => [:server]
