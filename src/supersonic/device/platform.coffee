Promise = require 'bluebird'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.platform"

  ###*
   * @ngdoc method
   * @name platform
   * @module device
   * @description
   * Get the device's operating system name and version.
   * @returns {Promise} Promise resolves to the name and version of the operating system and the model of the device.
   * @usage
   * ```coffeescript
   * supersonic.device.platform().then( (platform) ->
   *  console.log('Name: '  + platform.name  + '\n' +
   *              'Version: '  + platform.version  + '\n' +
   *              'Model: ' + platform.model)
   * )
   * ```
  ###
  platform = ->
    deviceready.then ->
      platform =
        name: device.platform
        version: device.version
        model: device.model
      new Promise (resolve) ->
        resolve platform

  return platform