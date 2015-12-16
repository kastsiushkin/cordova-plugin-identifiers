/**
* Created with JetBrains WebStorm.
* User: user
* Date: 1/17/14
* Time: 3:05 PM
* To change this template use File | Settings | File Templates.
*/
var exec = require('cordova/exec');

var getIDFA = function (success, failure) {
  exec(success, failure, "CDVIdfa", "advertisingIdentifier", []);
};

module.exports = IdentifiersPlugin;
