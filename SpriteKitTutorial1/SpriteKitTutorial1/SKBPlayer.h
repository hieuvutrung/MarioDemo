//
//  SKBPlayer.h
//  SpriteKitTutorial1
//
//  Created by hieu on 4/1/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKBSpriteTextures.h"
#import "AppDelegate.h"
#define kPlayerSpawnSoundFileName    @"SpawnPlayer.caf"
#define kPlayerRunSoundFileName      @"Run.caf"
#define kPlayerSkidSoundFileName     @"Skid.caf"
#define kPlayerJumpSoundFileName     @"Jump.caf"
#define kPlayerRunningIncrement      100
#define kPlayerSkiddingIncrement      20
#define kPlayerJumpingIncrement       8
typedef enum : int{
    SBPlayerFacingLeft = 0,
    SBPlayerFacingRight,
    SBPlayerRunningLeft,
    SBPlayerRunningRight,
    SBPlayerSkiddingLeft,
    SBPlayerSkiddingRight,
    SBPlayerJumpingLeft,
    SBPlayerJumpingRight,
    SBPlayerJumpingUpFacingLeft,
    SBPlayerJumpingUpFacingRight
}SBPlayerStatus;

@interface SKBPlayer : SKSpriteNode
@property (nonatomic, strong) SKBSpriteTextures *spriteTextures;
@property SBPlayerStatus playerStatus;

// sound action
@property (nonatomic, strong) SKAction *spawnSound;
@property (nonatomic, strong) SKAction *runSound, *jumpSound, *skidSound;


+ (SKBPlayer*)initNewPlayer:(SKScene*)whichScene startingPoint:(CGPoint)location;
- (void)wrapPlayer:(CGPoint)where;
- (void)runLeft;
- (void)runRight;
- (void)skidLeft;
- (void)skidRight;
- (void)jump;
- (void)spawnedInScene:(SKScene *)whichScene;
@end
