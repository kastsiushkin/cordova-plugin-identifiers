/*
Alvaro Rojas
 */

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface AnalyticsPlugin : CDVPlugin {
    UIDevice *myDevice;
}

- (void)init:(CDVInvokedUrlCommand*)command;
- (void)track:(CDVInvokedUrlCommand*)command;
- (void)alias:(CDVInvokedUrlCommand*)command;
- (void)peopleIncrement:(CDVInvokedUrlCommand*)command;
- (void)peopleTrackCharge:(CDVInvokedUrlCommand*)command;
- (void)peopleSet:(CDVInvokedUrlCommand*)command;
- (void)getDeviceValues:(CDVInvokedUrlCommand*)command;



//Get values from mobile devices
- (NSString*)iOSAppRelease;
- (NSString*)iOSDeviceUDID;
- (NSString*)iOSDeviceName;
- (NSString*)iOSDeviceSystemName;
- (NSString*)iOSDeviceOSVersion;
- (NSString*)iOSDeviceModel;
- (NSString*)iOSCarrier;
- (NSString*)iOSIfa;
- (NSString*)iOSIfv;
- (NSString*)iOSScreenWidth;
- (NSString*)iOSScreenHeight;
- (NSString*)iOSWiFiConnection;

@end
