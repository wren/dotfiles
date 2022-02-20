local config = {}

require 'config.helpers'
merge(config, require 'config.font')
merge(config, require 'config.colors')
merge(config, require 'config.window')
merge(config, require 'config.keys')

return config
