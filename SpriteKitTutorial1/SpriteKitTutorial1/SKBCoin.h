//
//  SKBCoin.h
//  SpriteKitTutorial1
//
//  Created by hieu on 4/6/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKBSpriteTextures.h"
#import "AppDelegate.h"
#define kCoinRunningIncrement      40
typedef enum:int{
    SBCoinRunningLeft = 0,
    SBCoinRunningRight
}SBCoinStatus;
@interface SKBCoin : SKSpriteNode
@property int coinStatus;
@property (nonatomic, strong) SKBSpriteTextures *spriteTextures;
+ (SKBCoin *)initNewCoin:(SKScene *)whichScene startingPoint:(CGPoint)location
               coinIndex:(int)index;
- (void)spawnedInScene:(SKScene *)whichScene;
- (void)wrapCoin:(CGPoint)where;
- (void)runRight;
- (void)runLeft;
- (void)turnRight;
- (void)turnLeft;
@end
