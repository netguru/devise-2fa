module ApplicationHelper
  def google_authenticator_qrcode(user)
    data = user.provisioning_uri
    data = Rack::Utils.escape(data)
    url = "https://chart.googleapis.com/chart?chs=200x200&chld=M|0&cht=qr&chl=#{data}"
    return image_tag(url, :alt => 'Google Authenticator QRCode')
  end
end
