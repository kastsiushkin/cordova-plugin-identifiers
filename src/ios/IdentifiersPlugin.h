#import <AdSupport/ASIdentifierManager.h>
#import <Cordova/CDVPlugin.h>

@interface IdentifiersPlugin : CDVPlugin

- (void) getIDFA:(CDVInvokedUrlCommand*)command;
- (void) getIDFV:(CDVInvokedUrlCommand*)command;

@end
