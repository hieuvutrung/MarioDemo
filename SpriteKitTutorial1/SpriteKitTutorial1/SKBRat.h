//
//  SKBRat.h
//  SpriteKitTutorial1
//
//  Created by hieu on 4/6/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "SKBSpriteTextures.h"
typedef enum : int{
    SBRatzRunningLeft = 0,
    SBRatzRunningRight
}SBRatzStatus;
@interface SKBRat : SKSpriteNode
#define kRatzSpawnSoundFileName         @"SpawnEnemy.caf"
#define kEnemySpawnEdgeBufferX          60
#define kEnemySpawnEdgeBufferY          60
#define kRatzRunningIncrement           40
@property int ratzStatus;
@property (strong,nonatomic) SKBSpriteTextures *spriteTextures;
@property (nonatomic, strong) SKAction *spawnSound;
+ (SKBRat *)initNewRatz:(SKScene *)whichScene startingPoint:(CGPoint)location
               ratzIndex:(int)index;
- (void)spawnedInScene:(SKScene *)whichScene;
- (void)wrapRatz:(CGPoint)where;
- (void)runRight;
- (void)runLeft;
- (void)turnRight;
- (void)turnLeft;
@end
