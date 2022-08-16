class ApplicationController < ActionController::Base
  before_action :set_client

  def current_client
    client_id = get_client_id_from_cookies
    logger.debug("cookies cleint_id = #{client_id}")

    remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    user_agent = request.user_agent

    # TODO: もうちょっとエラー処理を
    # TODO: 汎用的に

    if client_id.nil?
      client = Client.create(
        latest_ip: remote_ip,
        latest_user_agent: user_agent
      )
      set_client_id_to_cookies(client.id)
    else
      client = Client.find(client_id)
      client.update(
        latest_ip: remote_ip,
        latest_user_agent: user_agent
      )
    end

    return client
  end

  def get_client_id_from_cookies
    return cookies.permanent.signed[:client_id]
  end

  def set_client_id_to_cookies(client_id)
    cookies.permanent.signed[:client_id] = client_id
  end

  def set_client
    @client = current_client
  end
end
