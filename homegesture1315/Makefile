TARGET := iphone:clang:latest:12.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HomeGesture1315

HomeGesture1315_FILES = HGERootListController.m
HomeGesture1315_FRAMEWORKS = UIKit
HomeGesture1315_PRIVATE_FRAMEWORKS = Preferences
HomeGesture1315_INSTALL_PATH = /Library/PreferenceBundles
HomeGesture1315_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
