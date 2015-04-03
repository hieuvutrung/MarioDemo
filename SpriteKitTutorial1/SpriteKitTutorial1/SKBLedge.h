//
//  SKBLedge.h
//  SpriteKitTutorial1
//
//  Created by hieu on 4/3/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "AppDelegate.h"
#define kLedgeBrickFileName @"LedgeBrick.png"
#define kLedgeBrickSpacing  9
#define kLedgeSideBufferSpacing 4
@interface SKBLedge : NSObject
- (void)createNewSetOfLedgeNodes:(SKScene *)whichScene startingPoint:(CGPoint)leftSide
               withHowManyBlocks:(int)blockCount startingIndex:(int)indexStart;
@end
