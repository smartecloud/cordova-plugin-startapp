
var StartApp = function () { }

var exec = require('cordova/exec');
//   utils = require('cordova/utils'),
// var  cordova = require('cordova');

StartApp.prototype.isPlatformIOS = function () {
    return (device.platform === 'iPhone' ||
        device.platform === 'iPad' ||
        device.platform === 'iPod touch' ||
        device.platform === 'iOS')
}

StartApp.prototype.errorCallback = function (msg) {
    console.log('StartApp Callback Error: ' + msg)
}

StartApp.prototype.callNative = function (name, args, successCallback, errorCallback) {
    if (errorCallback) {
        cordova.exec(successCallback, errorCallback, 'StartApp', name, args)
    } else {
        cordova.exec(successCallback, this.errorCallback, 'StartApp', name, args)
    }
}

StartApp.prototype.check = function (uri, successCallback, errorCallback) {
    console.log("uri->" + uri);
    this.callNative('check', [uri], null)
}

StartApp.prototype.start = function (uri, successCallback, errorCallback) {
    console.log("uri->" + uri);
    this.callNative('start', [uri], null)
}

exports.coolMethod = function(arg0, success, error) {
    exec(success, error, "StartApp", "coolMethod", [arg0]);
};


if (!window.plugins) {
  window.plugins = {}
}

if (!window.plugins.startApp) {
  window.plugins.startApp = new StartApp()
}

module.exports = new StartApp()
