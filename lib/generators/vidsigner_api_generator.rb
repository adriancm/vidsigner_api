class VidsignerApiGenerator < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__)))
  def copy_initializer
    copy_file 'vidsigner_api_initializer.rb', 'config/initializers/vidsigner_api_initializer.rb'
    copy_file 'vidsigner_api_config.yml', 'config/vidsigner_api_config.yml'
  end
end