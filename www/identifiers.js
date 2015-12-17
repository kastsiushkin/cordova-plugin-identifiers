var exec = require('cordova/exec');

var IdentifiersPlugin = function() {
  this.serviceName = 'IdentifiersPlugin';
};

IdentifiersPlugin.prototype.getDeviceValues = function (success, failure) {
  exec(success, failure, this.serviceName, "getDeviceValues", []);
};

var identifiers = new IdentifiersPlugin();

module.exports = identifiers;
