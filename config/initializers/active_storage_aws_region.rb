if Rails.env.production? && Rails.application.config.active_storage.service == :amazon
  cfg = Rails.application.config.active_storage.service_configurations
  # 文字列キー/シンボルキーの両対応で amazon 設定を取得/生成して region を差す
  svc = (cfg[:amazon] ||= cfg["amazon"] ||= {})
  svc[:region] ||= ENV.fetch("AWS_REGION", "ap-southeast-2")
end
