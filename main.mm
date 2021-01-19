#include <qibusinputcontext.h>
#include <qibusbus.h>

#import <Cocoa/Cocoa.h>
#import <InputMethodKit/InputMethodKit.h>

#import "MakibusController.h"

const NSString* kConnectionName = @"Makibus_Connection";
IMKServer*      server;
IMKCandidates*  candidates = nil;

int main(int argc, char *argv[])
{
    IBus::Bus bus;

    @autoreleasepool{
        // Get bundle ID and register our service on IMK
        NSString* bundleID = [[NSBundle mainBundle] bundleIdentifier];
        server = [[IMKServer alloc] initWithName:(NSString*)kConnectionName
                                    bundleIdentifier:bundleID];

        candidates = [[IMKCandidates alloc]
                    initWithServer:server
                    panelType:kIMKSingleRowSteppingCandidatePanel];
    }

    return 0;
}
