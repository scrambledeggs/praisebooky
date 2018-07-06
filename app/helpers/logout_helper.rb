module LogoutHelper
  def logout_url
    domain = 'praisebooky.auth0.com'
    client_id = 'E1AFx4xIY-fFhudQQyZI1ykhJCp3vyDV'
    request_params = {
      returnTo: root_url,
      client_id: client_id
    }

    URI::HTTPS.build(host: domain, path: '/v2/logout', query: to_query(request_params))
  end

  private

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{URI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end
end
