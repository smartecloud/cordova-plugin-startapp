/********* StartApp.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface StartApp : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation StartApp

- (void)check:(CDVInvokedUrlCommand*)command {

    CDVPluginResult* pluginResult = nil;

    NSString* scheme = [command.arguments objectAtIndex:0];

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:(false)];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void)start:(CDVInvokedUrlCommand*)command {

    CDVPluginResult* pluginResult = nil;

    NSString* scheme = [command.arguments objectAtIndex:0];

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:scheme]];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];
    }else if ([scheme containsString:@"alipays://"])
    {

            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:scheme]];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];

    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:(false)];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void)go:(CDVInvokedUrlCommand*)command {

    CDVPluginResult* pluginResult = nil;

    NSString* scheme = [command.arguments objectAtIndex:0];

    if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:scheme]]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:(false)];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}
- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
