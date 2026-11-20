#include "HGERootListController.h"

@implementation HGERootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

- (void)twitter {
    UIApplication *app = [UIApplication sharedApplication];

    NSURL *twitter = [NSURL URLWithString:@"twitter://user?screen_name=brianvs"];
    NSURL *tweetbot = [NSURL URLWithString:@"tweetbot:///user_profile/brianvs"];
    NSURL *web = [NSURL URLWithString:@"https://twitter.com/brianvs"];

    if ([app canOpenURL:twitter]) {
        [app openURL:twitter options:@{} completionHandler:nil];
    } else if ([app canOpenURL:tweetbot]) {
        [app openURL:tweetbot options:@{} completionHandler:nil];
    } else {
        [app openURL:web options:@{} completionHandler:nil];
    }
}

-(void)repoLink {
    NSURL *url = [NSURL URLWithString:@"https://i0s-tweak3r-betas.yourepo.com"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

-(void)respring {
    system("killall -9 SpringBoard");
}

- (void)Paypal {
    NSURL *url = [NSURL URLWithString:@"https://paypal.me/i0stweak3r"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

@end
