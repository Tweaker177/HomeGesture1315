#import <UIKit/UIKit.h>
static bool kEnabled = NO;

%hook SBHomeGestureSettings
- (bool)isHomeGestureEnabled {
if(kEnabled) {
    return 1;
}
return %orig;
}
%end

%hook CCSControlCenterDefaults
- (unsigned long long)_defaultPresentationGesture {
if(kEnabled) {
    return 1;
}
return %orig;
}
%end

%hook SBControlCenterController
- (unsigned long long)presentingEdge {
if(kEnabled) {
    return 1;
}
return %orig;
}
%end

%hook CCUIModularControlCenterOverlayViewController
- (void)dismissAnimated:(bool)arg1 withCompletionHandler:(id)arg2 {
if(kEnabled) {
    arg1 = 0;
    %orig;
}
return %orig(arg1,arg2);
}
%end

%hook CCUIOverlayStatusBarPresentationProvider
- (void)_addHeaderContentTransformAnimationToBatch:(id)arg1 transitionState:(id)arg2 {
if(kEnabled) {
return;
}
return %orig(arg1,arg2);
}
%end

%hook SBFHomeGrabberSettings
- (bool)isEnabled {
if(kEnabled) {
    return 1;
}
return %orig;
}
%end

/*******
This is ios 13 era codd fof nested folders minus the interfaces, was going to see in gf 
%hook SBFolderController
-(BOOL)shouldOpenFolderIcon:(SBIcon *)icon {
    if(kEnabled && kWantsNestedFolders) {
        return YES;
    }
    return %orig;
}
-(BOOL)canAcceptFolderIconDrags {
    if(kEnabled && kWantsNestedFolders) {
        return YES;
    }
    return %orig;
}
%end

%hook SBIconView
-(BOOL)canRecieveGrabbedIcon:(id)icon {
    if(kEnabled && kWantsNestedFolders) {
        return YES;
        %orig;
    }
    return %orig;
}
%end

%hook SBHIconManager
-(BOOL)allowsNestedFolders {
    if(kEnabled && kWantsNestedFolders) {
        return YES;
    }
    return %orig;
}
-(BOOL)icon:(SBIconView *)receiver canReceiveGrabbedIcon:(SBIconView *)received {
    if(kEnabled && kWantsNestedFolders) {
        return YES;
        %orig;
    }
    return %orig;
}
%end

%hook SBHFolderSettings
-(void)setAllowNestedFolders:(BOOL)arg1 {
    if(kEnabled && kWantsNestedFolders) {
        arg1 = YES;
        return %orig(arg1);
    }
    return %orig;
}

-(BOOL)allowNestedFolders {
    if(kEnabeled && kWantsNestedFolders) {
        return YES;
    }
    return %orig;
}
%end

static BOOL isCheckingModelConsistency = NO;

%hook SBHIconModel
-(void)checkModelConsistencyInRootFolder:(id)rootFolder {
    isCheckingModelConsistency = YES;
    return %orig(rootFolder);
    isCheckingModelConsistency = NO;
}
%end

%hook SBRootFolderWithDock
-(id)folderIcons {
    if(kEnabled && kWantsNestedFolders && isCheckingModelConsistency) {
        return [NSSet set];
    }
    return %orig;
}
%end

%hook SBFolderControllerBackgroundView
-(void)layoutSubviews {
    if(kEnabled && kWantsNestedFolders) {
    %orig;
    id delegate = self.delegate;
    if(delegate && [delegate isKindOfClass:%c(SBFolderController)]) {
        SBFolderController *folderController = (SBFolderController *)delegate;
        if(![folderController isKindOfClass:%c(SBRootFolderController)]) {
            [self setEffectActive:0];
            [folderController _removeFakeStatusBar];
        }
    }
        return;
    }
    else { return %orig; }
}
%end
//End of unrelated experimental code.  
***********/

//handle prefs with user defaults

static void
loadPrefs() {
    static NSUserDefaults *prefs = [[NSUserDefaults alloc]
                                    initWithSuiteName:@"com.i0stweak3r.homegesture1315"];
    kEnabled = [prefs boolForKey:@"enabled"];
    
}

%ctor {
    CFNotificationCenterAddObserver(
                                    CFNotificationCenterGetDarwinNotifyCenter(), NULL,
                                    (CFNotificationCallback)loadPrefs,
                                    CFSTR("com.i0stweak3r.homegesture1315/saved"), NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPrefs();
}
