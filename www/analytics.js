/**
 * Created with JetBrains WebStorm.
 * User: user
 * Date: 1/17/14
 * Time: 3:05 PM
 * To change this template use File | Settings | File Templates.
 */
var exec = require('cordova/exec');

var AnalyticsPlugin = function() {
    this.serviceName = "AnalyticsPlugin";
};

AnalyticsPlugin.prototype.getDeviceValues = function(successCallback, failureCallback, events) {
    exec(successCallback, failureCallback, this.serviceName, "getDeviceValues", events);
};
module.exports = AnalyticsPlugin;
