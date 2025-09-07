#if Rails.env.production?
#  region = ENV['AWS_REGION'].presence || 'ap-southeast-2'
#  # SDK は AWS_REGION / AWS_DEFAULT_REGION のどちらでも読む
#  ENV['AWS_REGION'] = region
#  ENV['AWS_DEFAULT_REGION'] ||= region
#end

if Rails.env.production?
  require "aws-sdk-s3"

  region =
    ENV["AWS_REGION"].presence ||
    ENV["AWS_DEFAULT_REGION"].presence ||
    "ap-southeast-2"

  # AWS SDK のデフォルト region を明示（これが肝）
  Aws.config.update(region: region)

  # 念のため ENV も揃える
  ENV["AWS_REGION"] = region
  ENV["AWS_DEFAULT_REGION"] ||= region
end
RUBY