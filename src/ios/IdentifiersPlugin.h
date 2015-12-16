#import <Cordova/CDVPlugin.h>

@interface IdentifiersPlugin : CDVPlugin

- (void) advertisingIdentifier:(CDVInvokedUrlCommand*)command;
- (void) getIDFV:(CDVInvokedUrlCommand*)command;

@end
