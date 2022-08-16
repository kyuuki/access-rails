class StaticPageController < ApplicationController
  def root
  end

  #
  # 画像を返す
  #
  def access
    remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    user_agent = request.user_agent
    host = request.headers["HTTP_HOST"]
    referer = request.headers["HTTP_REFERER"]

    # TODO: エラー処理
    Access.create(
      client: @client,
      ip: remote_ip,
      user_agent: user_agent,
      host: host,
      referer: referer
    )

    send_file "public/apple-touch-icon.png", type: "image/png", disposition: "inline"
  end
end
