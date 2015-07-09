require "vidsigner_api/version"

module VidsignerApi

  if ENV[:vidsigner_path] and defined? Rails != "constant"
    config_path = "#{ENV[:vidsigner_path]}/config/vidsigner_api_config.yml"
    DATA =  File.exists?(config_path) ? YAML.load_file(config_path) : raise "Config file doesn't exist"
  end

  def devices(env = nil)
    self.request("get", "devices", nil, env)
  end

  def create_document(data, env = nil)
    self.request("post", "documents", data, env)
  end

  def destroy_document(id, env = nil)
    self.request("delete", "documents", id, env)
  end

  def signed_documents(env = nil)
    self.request("get", "signeddocuments", nil, env)
  end

  def signed_document(id, env = nil)
    self.request("get", "signeddocuments", id, env)
  end

  def destroy_signed_document(id, env = nil)
    self.request("delete", "signeddocuments", id, env)
  end

  def document_info(id, env = nil)
    self.request("get", "documentinfo", id, env)
  end

  def document_list(param, env = nil)
    self.request("get", "documentlist", param, env)
  end

  def destroy_document_list(param, env = nil)
    self.request("delete", "documentlist", param, env)
  end

  private

  def self.request(http_method, action, param = nil, env = nil)
    data = env.blank? ? DATA[env.to_sym] : defined? Rails == "constant" ? DATA[Rails.env.to_sym] : DATA[ENV[:vidsigner_env].to_sym]

    auth = "Basic "+Base64.encode64("#{data[:username]}:#{data[:password]}")
    header = {"Authorization" => auth,
              "Connection" => "Keep-Alive"}

    http_method = http_method.lowercase
    action_uri =  http_method == "post" ? "#{data[:base_uri]}/#{action}" : "#{data[:base_uri]}/#{action}/#{param}"
    uri = URI(action_uri)
    req = "Net::HTTP::#{http_method.capitalize}".constantize.new(uri.path)
    req.initialize_http_header(header)
    req.body= param.to_json if http_method == "post"

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    response = http.request(req)

    return JSON.parse(response.body), response
  end
end
