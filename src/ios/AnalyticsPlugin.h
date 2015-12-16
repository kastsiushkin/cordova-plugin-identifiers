/*
Alvaro Rojas
 */

#import <Cordova/CDVPlugin.h>

@interface AnalyticsPlugin : CDVPlugin {
    UIDevice *myDevice;
}

- (void)getDeviceValues:(CDVInvokedUrlCommand*)command;
@end
