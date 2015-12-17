#import "IdentifiersPlugin.h"

@implementation IdentifiersPlugin

- (void)getDeviceValues:(CDVInvokedUrlCommand*)command {

    CDVPluginResult* pluginResult = nil;
    NSDictionary *resultDevice = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [self getIDFA], @"idfa",
                                  [self getIDFV], @"idfv"
                                  nil];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:resultDevice];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (NSString*) getIDFA:(CDVInvokedUrlCommand*)command {
  NSString *uniqueString = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
  return [self validateString:uniqueString];
}

- (NSString*) getIDFV:(CDVInvokedUrlCommand*)command {
  return [self validateString:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
}

- (NSString*)validateString:(NSString*)str {
    return str == nil? @"":str;
}

@end
