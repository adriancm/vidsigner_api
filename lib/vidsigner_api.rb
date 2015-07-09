require "vidsigner_api/version"

module VidsignerApi

  config_path = "#{ENV[:vidsigner_path]}/config/vidsigner_api_config.yml"
  DATA = YAML.load_file(config_path) if File.exists?(config_path)

  def devices(env = nil)

  end

  def create_document(env = nil)

  end

  def destroy_document(id, env = nil)

  end

  def signed_documents(env = nil)

  end

  def signed_document(id, env = nil)
  end

  def destroy_signed_document(id, env = nil)

  end

  def document_info(id, env = nil)

  end

  def document_list(param, env = nil)

  end

  def destroy_document_list(param, env = nil)

  end
end
