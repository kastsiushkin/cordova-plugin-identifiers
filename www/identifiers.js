var exec = require('cordova/exec');

var IdentifiersPlugin = function() {
  this.serviceName = 'IdentifiersPlugin';
};

IdentifiersPlugin.prototype.getIDFA = function (success, failure) {
  exec(success, failure, this.serviceName, "getIDFA", []);
};

IdentifiersPlugin.prototype.getIDFV = function(success, failure) {
  exec(success, failure, this.serviceName, "getIDFV", []);
};

var identifiers = new IdentifiersPlugin();

module.exports = identifiers;
