/**
 * Created with JetBrains WebStorm.
 * User: user
 * Date: 1/17/14
 * Time: 3:05 PM
 * To change this template use File | Settings | File Templates.
 */

cordova.define("cordova-plugin-segment.AnalyticsPlugin", function(require, exports, module) {

var exec = require('cordova/exec');

var AnalyticsPlugin = function() {
    this.serviceName = "AnalyticsPlugin";
};

AnalyticsPlugin.prototype.init = function(successCallback, failureCallback, mispanelToken) {
    exec(successCallback, failureCallback, this.serviceName, "init", [ mispanelToken ]);
};

AnalyticsPlugin.prototype.track = function(successCallback, failureCallback, events) {
    exec(successCallback, failureCallback, this.serviceName, "track", events);
};

AnalyticsPlugin.prototype.alias = function(successCallback, failureCallback, events) {
    exec(successCallback, failureCallback, this.serviceName, "alias", events);
};

AnalyticsPlugin.prototype.peopleIncrement = function(successCallback, failureCallback, events) {
    exec(successCallback, failureCallback, this.serviceName, "peopleIncrement", events);
};

AnalyticsPlugin.prototype.peopleTrackCharge = function(successCallback, failureCallback, events) {
    exec(successCallback, failureCallback, this.serviceName, "peopleTrackCharge", events);
};

AnalyticsPlugin.prototype.peopleSet = function(successCallback, failureCallback, events) {
    exec(successCallback, failureCallback, this.serviceName, "peopleSet", events);
};
AnalyticsPlugin.prototype.getDeviceValues = function(successCallback, failureCallback, events) {
    exec(successCallback, failureCallback, this.serviceName, "getDeviceValues", events);
};
module.exports = AnalyticsPlugin;

});
