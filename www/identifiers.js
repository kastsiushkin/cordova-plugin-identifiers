/**
* Created with JetBrains WebStorm.
* User: user
* Date: 1/17/14
* Time: 3:05 PM
* To change this template use File | Settings | File Templates.
*/
var exec = require('cordova/exec');

var IdentifiersPlugin = function() {};

IdentifiersPlugin.serviceName = 'Identifiers';

IdentifiersPlugin.prototype.getIDFA = function (success, failure) {
  exec(success, failure, "IdentifiersPlugin", "advertisingIdentifier", []);
};

var identifiers = IdentifiersPlugin();

module.exports = identifiers;
