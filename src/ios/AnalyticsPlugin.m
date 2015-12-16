/**
Alvaro Rojas
 *
 */

#import "AnalyticsPlugin.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <AdSupport/ASIdentifierManager.h>
#import "CDVReachability.h"
#include <sys/types.h>
#include <sys/sysctl.h>


#define DEBUG YES
@implementation AnalyticsPlugin

- (void)init:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    if ([command.arguments count] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"teamToken property is missing."];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getDeviceValues:(CDVInvokedUrlCommand*)command {
}

@end
