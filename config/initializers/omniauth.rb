Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'jGZwxdNVRtHn5GD8dR6Eg', 'KBUXeFgVyVIjcDQW70Lnirdd7rNP6orZuPtkSHtV4I'
  provider :facebook, '160185250668613', '6e3f7fbaf048ab7fbb5b6911caed2d69'
end