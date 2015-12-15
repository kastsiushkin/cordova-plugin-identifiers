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

- (void)track:(CDVInvokedUrlCommand*)command {
    if ([command.arguments count] > 1) {

    }
}

- (void)alias:(CDVInvokedUrlCommand*)command {
    if ([command.arguments count] > 0) {
        if (DEBUG) {
            NSLog(@"Alias: %@ ", [command.arguments objectAtIndex:0]);
        }
    }
}

- (void)peopleIncrement:(CDVInvokedUrlCommand*)command {
    if ([command.arguments count] > 1) {
        if (DEBUG) {
            NSLog(@"Event Name: %@ ", [command.arguments objectAtIndex:0]);
            NSLog(@"peopleIncrement: %@ ", [command.arguments objectAtIndex:1]);
        }
    }
}

- (void)peopleTrackCharge:(CDVInvokedUrlCommand*)command {
    if ([command.arguments count] > 0) {
        if (DEBUG) {
            NSLog(@"peopleTrackCharge: %@ ", [command.arguments objectAtIndex:0]);
        }
    }
}

- (void)peopleSet:(CDVInvokedUrlCommand*)command {
    if ([command.arguments count] > 0) {
        NSDictionary *people = [command.arguments objectAtIndex:0];

        if (DEBUG) {
            NSLog(@"People: %@ ", people);
        }
    }
}


- (void)getDeviceValues:(CDVInvokedUrlCommand*)command {

    myDevice = [UIDevice currentDevice];

    CDVPluginResult* pluginResult = nil;
    NSDictionary *resultDevice = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [self iOSAppRelease], @"iOS App Release",
                                  [self iOSIfa], @"iOS Ifa",
                                  [self iOSIfv], @"iOS Ifv",
                                  [self iOSDeviceModel], @"$device",
                                  [self iOSCarrier], @"Carrier",
                                  [self iOSScreenHeight], @"Screen Height",
                                  [self iOSScreenWidth], @"Screen Width",
                                  [self iOSWiFiConnection], @"Wifi",
                                  [self iOSDeviceOSVersion], @"App Version",
                                  nil];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:resultDevice];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

//Get Value from mobile phone

- (NSString*)iOSAppRelease {
    NSString * appBuildString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    return [self validateString:appBuildString];
}
- (NSString*)iOSDeviceUDID {
    NSUUID *myDeviceUUID = [NSUUID UUID];

    NSString *deviceUDID = myDeviceUUID.UUIDString;
    return [self validateString:deviceUDID];
}
- (NSString*)iOSDeviceName {
    return [self validateString:myDevice.name];
}
- (NSString*)iOSDeviceSystemName {
    return [self validateString:myDevice.systemName];
}
- (NSString*)iOSDeviceOSVersion {
    return [self validateString:myDevice.systemVersion];
}
- (NSString*)iOSDeviceModel {
    //Device model
    return [self platformString];
}
- (NSString*)iOSCarrier {
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return [self validateString:[carrier carrierName]];
}
- (NSString*)iOSIfa {
    NSString *uniqueString = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return [self validateString:uniqueString];
}
- (NSString*)iOSIfv {
    return [self validateString:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
}
- (NSString*)iOSScreenWidth {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return [self validateString:[NSString stringWithFormat:@"%.0lf", screenRect.size.width]];
}
- (NSString*)iOSScreenHeight {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return [self validateString:[NSString stringWithFormat:@"%.0lf", screenRect.size.height]];
}
- (NSString*)iOSWiFiConnection {
    if ([[CDVReachability reachabilityForLocalWiFi] currentReachabilityStatus] != ReachableViaWiFi) {
        //Code to execute if WiFi is not enabled
        return @"false";
    }return @"true";
}

- (NSString*)validateString:(NSString*)str {
    return str == nil? @"":str;
}

//Help Methods

- (NSString *) platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

- (NSString *) platformString{
    NSString *platform = [self platform];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (UK+Europe+Asis+China)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (UK+Europe+Asis+China)";

    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch (1 Gen)";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch (2 Gen)";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch (3 Gen)";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch (4 Gen)";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";

    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (GSM+CDMA)";

    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

- (NSNumber*)getNumberFromString:(NSString*)stringNumber {
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *numberValue = [f numberFromString:stringNumber];
    return numberValue;
}

@end
