//
//  SKBGameScene.h
//  SpriteKitTutorial1
//
//  Created by hieu on 4/1/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKBPlayer.h"
#import "SKBScores.h"
#import "SKBSpriteTextures.h"
@interface SKBGameScene : SKScene<SKPhysicsContactDelegate>

@property (strong, nonatomic) SKBPlayer *playerSprite;
@property (strong, nonatomic) SKBSpriteTextures *spriteTextures;
@property (strong, nonatomic) NSArray *cast_TypeArray, *cast_DelayArray, *cast_StartXindexArray;

@property int spawnedEnemyCount;
@property BOOL enemyIsSpawningFlag;
@property (nonatomic,strong) SKBScores *scoresDisplay;
@property int playerScore;
@end
