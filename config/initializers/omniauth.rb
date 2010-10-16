Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'jGZwxdNVRtHn5GD8dR6Eg', 'KBUXeFgVyVIjcDQW70Lnirdd7rNP6orZuPtkSHtV4I'
  provider :facebook, '132896900096297', 'c7503ac3767ae38df470ba7893f7abeb'
end