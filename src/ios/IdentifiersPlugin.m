#import "IdentifiersPlugin.h"
#import "AppleAdvertising.h"
#import <AdSupport/ASIdentifierManager.h>

@implementation IdentifiersPlugin

- (void) advertisingIdentifier:(CDVInvokedUrlCommand*)command {
  NSString *result = nil;
  CDVPluginResult* pluginResult = nil;

  if ([self getAdvertisingIdentifier:&result] == 0)
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                     messageAsString:result];
  else
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                     messageAsString: result];

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (int) getAdvertisingIdentifier:(NSString**)aid {
  NSString *uuid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];

  if (uuid) {
    *aid = uuid;
    return 0;
  }
  else {
    *aid = @"No Advertising Identifier for device";
    return -1;
  }
}

- (void) getIDFV:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;

        // throw error if on iOS < 6.0
        if (NSClassFromString(@"ASIdentifierManager")) {

            NSString *vendorID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:vendorID];
        }

        else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    }];
}

@end
