if Rails.env.production?
  region = ENV['AWS_REGION'].presence || 'ap-southeast-2'
  # SDK は AWS_REGION / AWS_DEFAULT_REGION のどちらでも読む
  ENV['AWS_REGION'] = region
  ENV['AWS_DEFAULT_REGION'] ||= region
end
