var exec = require('cordova/exec'),
	channel = require('cordova/channel'),
	utils = require('cordova/utils');

var IdentifiersPlugin = function() {
  this.serviceName = 'IdentifiersPlugin';
  this.values = null;

  var me = this;

  channel.onCordovaReady.subscribe(function() {
        me.getDeviceValues(function(values) {
        	me.values = values;
            channel.onCordovaInfoReady.fire();
        },function(e) {
            me.available = false;
            utils.alert("[ERROR] Error initializing Cordova: " + e);
        });
    });
};

IdentifiersPlugin.prototype.getDeviceValues = function (success, failure) {
  exec(success, failure, this.serviceName, "getDeviceValues", []);
};

module.exports = new IdentifiersPlugin();
