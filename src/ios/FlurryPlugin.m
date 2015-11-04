//
//  FlurryPlugin.m
//  Trailerpop
//
//  Created by John Potter on 11/21/12.
//  Changed by Christoph Atteneder
//
//

#import "FlurryPlugin.h"
#import "Flurry.h"

@implementation FlurryPlugin

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}


//
// These functions must be called before you start the Flurry session
//

- (void) setVersionName:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Setting Flurry version to %@", [command.arguments objectAtIndex:0]);
        
        @try {
            NSString* version = [command.arguments objectAtIndex:0];
            [Flurry setAppVersion: version];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setLogEvents:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Enabling Flurry Event Logging");
        
        @try {
            bool Value = [[command.arguments objectAtIndex:0]boolValue];
            
            [Flurry setEventLoggingEnabled: Value];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setLogEnabled:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Enabling Flurry Debug Logging");
        
        @try {
            bool Value = [[command.arguments objectAtIndex:0]boolValue];
            
            [Flurry setDebugLogEnabled: Value];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setLogLevel:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;

        
        NSLog(@"Enabling Show Error in Flurry Event Logging");
        
        @try {
            bool Value = [[command.arguments objectAtIndex:0]boolValue];
            
            [Flurry setShowErrorInLogEnabled: Value];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setReportLocation:(CDVInvokedUrlCommand*)command
{
   NSLog(@"setReportLocation Not Available for IOS");
}

- (void) setPulseEnabled:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Enabling Pulse Logging");
        
        @try {
            bool Value = [[command.arguments objectAtIndex:0]boolValue];
            
            [Flurry setPulseEnabled: Value];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setContinueSessionMillis:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Setting Flurry Session Limit to %@", [command.arguments objectAtIndex:0]);
        
        @try {
            int Seconds = [[command.arguments objectAtIndex:0]integerValue] / 1000;
            
            [Flurry setSessionContinueSeconds: Seconds];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setCrashReportingEnabled:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        NSLog(@"Enabling Crash Reporting in Flurry");
        
        @try {
            bool enabled = [[command.arguments objectAtIndex:0]boolValue];
            [Flurry setCrashReportingEnabled: enabled];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) addOrigin:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
                
        NSLog(@"Logging originName %@", [command.arguments objectAtIndex:0]);
        NSLog(@"Logging originVersion %@", [command.arguments objectAtIndex:1]);
        
        @try {
            NSString* originName = [command.arguments objectAtIndex:0];
            NSString* originVersion = [command.arguments objectAtIndex:1];
            
            [Flurry addOrigin: originName, originVersion ];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) addOriginWithParameters:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
 
        NSLog(@"Logging originName %@", [command.arguments objectAtIndex:0]);
        NSLog(@"Logging originVersion %@", [command.arguments objectAtIndex:1]);
        NSLog(@"Logging originParameters %@", [command.arguments objectAtIndex:2]);
        
        @try {
            NSString* originName = [command.arguments objectAtIndex:0];
            NSString* originVersion = [command.arguments objectAtIndex:1]; 
            NSDictionary* parameters =  [NSDictionary dictionaryWithDictionary:[command.arguments objectAtIndex:2]];        
            
            [Flurry logEvent:originName, originVersion withParameters:parameters];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];

}

- (void) setGender:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Setting Flurry Gender to %@", [command.arguments objectAtIndex:0]);
        
        @try {
            NSString* Gender = [command.arguments objectAtIndex:0];
            
            [Flurry setGender: Gender];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setUserID:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Setting Flurry User ID to %@", [command.arguments objectAtIndex:0]);
        
        @try {
            NSString* userID = [command.arguments objectAtIndex:0];
            
            [Flurry setUserID: userID];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setAge:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Setting Flurry Age to %@", [command.arguments objectAtIndex:0]);
        
        @try {
            int Age = [[command.arguments objectAtIndex:0]integerValue];
            
            [Flurry setAge: Age];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

//
// End of functions that must be called before Flurry session starts
//
    
- (void) startSession:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        NSString* key = [command.arguments objectAtIndex:0];

        // NSString* javaScript = nil;
        
        NSLog(@"Starting Flurry Session with key %@", key);
        
        @try {
            if (key != nil) {
                dispatch_sync(dispatch_get_main_queue(), ^{[Flurry startSession: key];});
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                // starting Flurry - Update Key before releasing
            }
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) endSession:(CDVInvokedUrlCommand*)command
{
   NSLog(@"endSession Not Available for IOS");
}

- (void) logEvent:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSString* event = [command.arguments objectAtIndex:0];
        
        NSLog(@"Logging Event %@", event);
        
        @try {
            
            [Flurry logEvent: event];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) logEventWithParameters:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Logging Event %@", [command.arguments objectAtIndex:0]);
        NSLog(@"Event Parameters: %@", [command.arguments objectAtIndex:1]);
        
        @try {
            NSString* event = [command.arguments objectAtIndex:0];
            NSDictionary* parameters = [NSDictionary dictionaryWithDictionary:[command.arguments objectAtIndex:1]];
            
            [Flurry logEvent:event withParameters:parameters];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) logTimedEvent:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Logging Timed Event %@", [command.arguments objectAtIndex:0]);
        
        @try {
            NSString* event = [command.arguments objectAtIndex:0];
            bool Timed = [[command.arguments objectAtIndex:1]boolValue];
            
            [Flurry logEvent:event timed:Timed];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) logTimedEventWithParameters:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;

        NSLog(@"Logging Event %@", [command.arguments objectAtIndex:0]);
        NSLog(@"Event Parameters: %@", [command.arguments objectAtIndex:1]);

        @try 
        {

            NSString* event = [command.arguments objectAtIndex:0];
            NSDictionary* parameters = [NSDictionary dictionaryWithDictionary:[command.arguments objectAtIndex:1]];
            bool Timed = [[command.arguments objectAtIndex:2]boolValue];

            [Flurry logEvent:event withParameters:parameters timed:Timed];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) 
        {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
            messageAsString:[exception reason]];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) endTimedEvent:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Logging End of Timed Event %@", [command.arguments objectAtIndex:0]);
        
        @try {
            NSString* event = [command.arguments objectAtIndex:0];
           
            [Flurry endTimedEvent:event withParameters:nil];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) endTimedEventWithParameters:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Ending Timed Event %@", [command.arguments objectAtIndex:0]);
        NSLog(@"Event Parameters: %@", [command.arguments objectAtIndex:1]);
        
        @try {
            NSString* event = [command.arguments objectAtIndex:0];
            NSDictionary* parameters = [NSDictionary dictionaryWithDictionary:[command.arguments objectAtIndex:1]];
            
            [Flurry endTimedEvent:event withParameters:parameters];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) onPageView:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Logging Page View");
        
        @try {
            
            [Flurry logPageView];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setLocation:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Reporting location to Flurry");
        
        @try {
            double Latitude   = [[command.arguments objectAtIndex:0]doubleValue];
            double Longitude  = [[command.arguments objectAtIndex:1]doubleValue];
            float  Horizontal = [[command.arguments objectAtIndex:2]floatValue];
            float  Vertical   = [[command.arguments objectAtIndex:3]floatValue];
            
            [Flurry setLatitude: Latitude longitude:Longitude horizontalAccuracy:Horizontal verticalAccuracy:Vertical ];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) onError:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSString* errorID = [command.arguments objectAtIndex:0];
        NSString* message = [command.arguments objectAtIndex:1];
        
        NSLog(@"Logging Error with id %@", errorID);
        
        @try {
            
            [Flurry logError:errorID message:message error:nil];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) getSessionId:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Logging getSessionID");
        
        @try {
            
            [Flurry getSessionID];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) getReleaseVersion:(CDVInvokedUrlCommand*)command
{
    // TODO
}

- (void) getAgentVersion:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Logging getAgentVersion");
        
        @try {
            
            [Flurry getFlurryAgentVersion];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) isSessionActive:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Logging isSessionActive");
        
        @try {
            
            [Flurry activeSessionExists];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setSessionReportsOnCloseEnabled:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Enabling Flurry Report On App Closing");
        
        @try {
            bool Value = [[command.arguments objectAtIndex:0]boolValue];
            
            [Flurry setSessionReportsOnCloseEnabled: Value];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setSessionReportsOnPauseEnabled:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        NSLog(@"Enabling Flurry Report On App Pausing");
        
        @try {
            bool Value = [[command.arguments objectAtIndex:0]boolValue];
            
            [Flurry setSessionReportsOnPauseEnabled: Value];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}



@end
