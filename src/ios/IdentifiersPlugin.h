#import <AdSupport/ASIdentifierManager.h>
#import <Cordova/CDVPlugin.h>

@interface IdentifiersPlugin : CDVPlugin

- (void) getDeviceValues:(CDVInvokedUrlCommand*)command;

- (NSString*)getIDFA;
- (NSString*)getIDFV;

@end
