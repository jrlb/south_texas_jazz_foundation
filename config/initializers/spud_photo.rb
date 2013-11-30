Spud::Photos.configure do |config|
  config.base_layout = 'application'
  config.galleries_enabled = false
  config.base_path = 'photos'
  config.photo_styles = {
    small: '50x50#',
    medium: '200x200#',
    large: '400x400#',
    huge: '600x600'
  }
  config.paperclip_storage = :s3
  config.s3_credentials = {
    access_key_id: ENV.fetch('ACCESS_KEY'),
    secret_access_key: ENV.fetch('SECRET_KEY'),
    bucket: ENV.fetch('BUCKET'),
  }
end
