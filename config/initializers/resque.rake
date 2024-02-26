# frozen_string_literal: true

Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))
Resque.logger.level = Logger::INFO

# uri = URI.parse("redis://localhost:6379")
# REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
# Resque.redis = REDIS
