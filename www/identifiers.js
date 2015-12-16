var exec = require('cordova/exec');

var IdentifiersPlugin = function() {};

IdentifiersPlugin.serviceName = 'Identifiers';

IdentifiersPlugin.prototype.getIDFA = function (success, failure) {
  exec(success, failure, "IdentifiersPlugin", "advertisingIdentifier", []);
};

IdentifiersPlugin.prototype.getIDFV = function(success, failure) {
  exec(success, failure, "IdentifiersPlugin", "getIDFV", []);
};

var identifiers = new IdentifiersPlugin();

module.exports = identifiers;
