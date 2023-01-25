#import <UIKit/UIKit.h>

%hook SBHomeGestureSettings
- (bool)isHomeGestureEnabled {
    return 1;
}
%end

%hook CCSControlCenterDefaults
- (unsigned long long)_defaultPresentationGesture {
    return 1;
}
%end

%hook SBControlCenterController
- (unsigned long long)presentingEdge {
    return 1;
}
%end

%hook CCUIModularControlCenterOverlayViewController
- (void)dismissAnimated:(bool)arg1 withCompletionHandler:(id)arg2 {
    arg1 = 0;
    %orig;
}
%end

%hook CCUIOverlayStatusBarPresentationProvider
- (void)_addHeaderContentTransformAnimationToBatch:(id)arg1 transitionState:(id)arg2 {
}
%end

%hook SBFHomeGrabberSettings
- (bool)isEnabled {
    return 1;
}
%end

