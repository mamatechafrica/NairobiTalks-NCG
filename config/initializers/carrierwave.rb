require "carrierwave"

CarrierWave.configure do |config|
  config.content_type_whitelist = [ /image\// ]
end
