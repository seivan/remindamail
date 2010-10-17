Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'jGZwxdNVRtHn5GD8dR6Eg', 'KBUXeFgVyVIjcDQW70Lnirdd7rNP6orZuPtkSHtV4I'
  provider :facebook, '155158267853854', '31316b870cd9d016c4f50763d85727d9'
end