_ = require 'underscore'
glob = require 'glob'
path = require 'path'

exports.register = (plugin, options, next) ->
  defaults =
    host: 'localhost'
    port: 28015
    db: 'test'
    modelsDir: '/models'

  options = _.extend defaults, options

  thinky = require('thinky')(options)
  plugin.expose('thinky', thinky)
  plugin.expose('r', thinky.r)
  for file in glob.sync(process.cwd() + options.modelsDir + "/*")
    modelName = path.basename(file, path.extname(file))
    plugin.expose(modelName, require(file)(thinky, thinky.r))

  plugin.log(['hapi-thinky', 'info'], 'Rethinkdb connection created')

  next()

exports.register.attributes =
  pkg: require('./package.json')

