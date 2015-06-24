#import "HeadsetDetection.h"
#import <Cordova/CDV.h>

@implementation HeadsetDetection

- (void) detect:(CDVInvokedUrlCommand*)command {
  NSString *callbackId = command.callbackId;
  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:[self isHeadsetEnabled]];
  [self.commandDelegate sendPluginResult:result callbackId:callbackId];
}

- (BOOL)isHeadsetEnabled
{
    AVAudioSessionRouteDescription *route = [[AVAudioSession sharedInstance] currentRoute];

    BOOL headphonesLocated = NO;
    for( AVAudioSessionPortDescription *portDescription in route.outputs )
    {
        headphonesLocated |= ( [portDescription.portType isEqualToString:AVAudioSessionPortHeadphones] );
    }
    return headphonesLocated;
}


@end
