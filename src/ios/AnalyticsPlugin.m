#import "AnalyticsPlugin.h"
#import <Cordova/CDV.h>

@implementation AnalyticsPlugin : CDVPlugin

- (void)pluginInitialize
{
    NSLog(@"[cordova-plugin-segment] plugin initialized");

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];
}

@end
