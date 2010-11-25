Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'jGZwxdNVRtHn5GD8dR6Eg', 'KBUXeFgVyVIjcDQW70Lnirdd7rNP6orZuPtkSHtV4I'
  provider :facebook, '164395383598978', '94c1883e6557afc51f1ea4f13d28cfff'
end