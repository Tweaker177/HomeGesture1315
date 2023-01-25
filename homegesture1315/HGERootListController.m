#include "HGERootListController.h"

@implementation HGERootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)twitter {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=brianvs"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=brianvs"]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:///user_profile/brianvs"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetbot:///user_profile/brianvs"]];
    }  else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/brianvs"]];
    }
}

-(void)repoLink {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://i0s-tweak3r-betas.yourepo.com"]];

-(void)respring {
         system("killall -9 SpringBoard");
      }
- (void)Paypal
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/i0stweak3r"]];
}
@end
