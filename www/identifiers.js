var exec = require('cordova/exec');

var IdentifiersPlugin = function() {};

IdentifiersPlugin.serviceName = 'Identifiers';

IdentifiersPlugin.prototype.getIDFA = function (success, failure) {
  exec(success, failure, "IdentifiersPlugin", "advertisingIdentifier", []);
};

var identifiers = new IdentifiersPlugin();

module.exports = identifiers;
