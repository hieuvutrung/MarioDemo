//
//  AppDelegate.h
//  SpriteKitTutorial1
//
//  Created by hieu on 4/1/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import <UIKit/UIKit.h>
// Global project constants
static const uint32_t kPlayerCategory = 0x1 << 0;
static const uint32_t kBaseCategory = 0x1 << 1;
static const uint32_t kWallCategory = 0x1 << 2;
static const uint32_t kLedgeCategory = 0x1 << 3;
static const uint32_t kRatzCategory = 0x1<< 4;
static const uint32_t kCoinCategory = 0x1<< 5;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

