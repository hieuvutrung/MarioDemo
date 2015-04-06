//
//  SKBGameScene.m
//  SpriteKitTutorial1
//
//  Created by hieu on 4/1/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import "SKBGameScene.h"
#import "AppDelegate.h"
#import "SKBPlayer.h"
#import "SKBRat.h"
#import "SKBLedge.h"
@implementation SKBGameScene
{
    SKSpriteNode *brickBase;
}
- (void)didMoveToView:(SKView *)view
{
    self.backgroundColor = [UIColor blackColor];
    // CGRect edgeRect = CGRectMake(0.0, 0.0, 568.0, 420.0);
    
    // self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:edgeRect];
    // this example uses the simpler rectangle variety to create an edge along all four sides of the game screen, or scene.
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    // setup bitmask
    self.physicsBody.categoryBitMask = kWallCategory;
    self.physicsWorld.contactDelegate = self;
    self.spriteTextures = [[SKBSpriteTextures alloc]init];
    [self.spriteTextures createAnimationTextures];
    //add background node
    [self createSettings];
    [self addBackgroundNode];
    [self addBrickBaseNode];
    [self addLedge];
}
- (void)addLedge
{
    // add ledge
    SKBLedge *sceneLedge = [[SKBLedge alloc] init];
    /*ledgesidebuffer align left spacing
     number of blocks of ledge
     */
    int ledgeIndex = 0;
    
    // ledge, bottom left
    int howMany = 0;
    if (CGRectGetMaxX(self.frame) < 500)
        howMany = 18;
    else
        howMany = 23;
    [sceneLedge createNewSetOfLedgeNodes:self startingPoint:CGPointMake(kLedgeSideBufferSpacing, brickBase.position.y+80) withHowManyBlocks:howMany startingIndex:ledgeIndex];
    ledgeIndex = ledgeIndex + howMany;
    
    // ledge, bottom right
    if (CGRectGetMaxX(self.frame) < 500)
        howMany = 18;
    else
        howMany = 23;
    [sceneLedge createNewSetOfLedgeNodes:self startingPoint:CGPointMake(CGRectGetMaxX(self.frame)-kLedgeSideBufferSpacing-((howMany-1)*kLedgeBrickSpacing), brickBase.position.y+80) withHowManyBlocks:howMany startingIndex:ledgeIndex];
    ledgeIndex = ledgeIndex + howMany;
    
    // ledge, middle left
    if (CGRectGetMaxX(self.frame) < 500)
        howMany = 6;
    else
        howMany = 8;
    [sceneLedge createNewSetOfLedgeNodes:self startingPoint:CGPointMake(CGRectGetMinX(self.frame)+kLedgeSideBufferSpacing, brickBase.position.y+142) withHowManyBlocks:howMany startingIndex:ledgeIndex];
    ledgeIndex = ledgeIndex + howMany;
    
    // ledge, middle middle
    if (CGRectGetMaxX(self.frame) < 500)
        howMany = 31;
    else
        howMany = 36;
    [sceneLedge createNewSetOfLedgeNodes:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)-((howMany * kLedgeBrickSpacing) / 2), brickBase.position.y+152) withHowManyBlocks:howMany startingIndex:ledgeIndex];
    ledgeIndex = ledgeIndex + howMany;
    
    // ledge, middle right
    if (CGRectGetMaxX(self.frame) < 500)
        howMany = 6;
    else
        howMany = 9;
    [sceneLedge createNewSetOfLedgeNodes:self startingPoint:CGPointMake(CGRectGetMaxX(self.frame)-kLedgeSideBufferSpacing-((howMany-1)*kLedgeBrickSpacing), brickBase.position.y+142) withHowManyBlocks:howMany startingIndex:ledgeIndex];
    ledgeIndex = ledgeIndex + howMany;
    
    // ledge, top left
    if (CGRectGetMaxX(self.frame) < 500)
        howMany = 23;
    else
        howMany = 28;
    [sceneLedge createNewSetOfLedgeNodes:self startingPoint:CGPointMake(CGRectGetMinX(self.frame)+kLedgeSideBufferSpacing, brickBase.position.y+224) withHowManyBlocks:howMany startingIndex:ledgeIndex];
    ledgeIndex = ledgeIndex + howMany;
    
    // ledge, top right
    if (CGRectGetMaxX(self.frame) < 500)
        howMany = 23;
    else
        howMany = 28;
    [sceneLedge createNewSetOfLedgeNodes:self startingPoint:CGPointMake(CGRectGetMaxX(self.frame)-kLedgeSideBufferSpacing-((howMany-1)*kLedgeBrickSpacing), brickBase.position.y+224) withHowManyBlocks:howMany startingIndex:ledgeIndex];
    ledgeIndex = ledgeIndex + howMany;
    
}
- (void)createSettings
{
    // Initialize Enemies & Schedule
    _spawnedEnemyCount = 0;
    _enemyIsSpawningFlag = NO;
}
#pragma mark - Contact delegate
- (void)didBeginContact:(SKPhysicsContact *)contact;
{
    SKPhysicsBody *firstBody, *secondBody;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    NSString *firstBodyName = firstBody.node.name;
    // Player / sideWalls
    if ((((firstBody.categoryBitMask & kPlayerCategory) != 0) && ((secondBody.categoryBitMask &
                                                                   kWallCategory) != 0)))
    {
        if ([firstBodyName isEqualToString: @"player1"]) {
            if (_playerSprite.position.x < 20) {
                NSLog(@"player contacted left edge");
                // re-run from x = -10
                [_playerSprite wrapPlayer:CGPointMake(self.frame.size.width-10,
                                                      _playerSprite.position.y)];
            } else {
                NSLog(@"player contacted right edge");
                [_playerSprite wrapPlayer:CGPointMake(10, _playerSprite.position.y)];
            }
        }
    }
    
    // rats / sidewalls
    if ((((firstBody.categoryBitMask & kWallCategory)!=0)&& ((secondBody.categoryBitMask&  kRatzCategory)!=0))) {
        SKBRat *theRatz = (SKBRat *)secondBody.node;
        if (theRatz.position.x < 100) {
            [theRatz wrapRatz:CGPointMake(self.frame.size.width-11,
                                          theRatz.position.y)];
        } else {
            [theRatz wrapRatz:CGPointMake(11, theRatz.position.y)];
        }
    }
    // Player / Base
    if ((((firstBody.categoryBitMask & kPlayerCategory) != 0) &&
         ((secondBody.categoryBitMask & kBaseCategory) != 0)))
    {
        NSLog(@"player contacted brick base");
    }
    
    // Ratz / Ratz
    if ((((firstBody.categoryBitMask & kRatzCategory) != 0) &&
         ((secondBody.categoryBitMask & kRatzCategory) != 0))) {
        SKBRat *theFirstRatz = (SKBRat *)firstBody.node;
        SKBRat *theSecondRatz = (SKBRat *)secondBody.node;
        NSLog(@"%@ & %@ have collided...", theFirstRatz.name,
              theSecondRatz.name);
        // cause first Ratz to turn and change directions
        if (theFirstRatz.ratzStatus == SBRatzRunningLeft) {
            [theFirstRatz turnRight];
        } else if (theFirstRatz.ratzStatus == SBRatzRunningRight) {
            [theFirstRatz turnLeft];
        }
        // cause second Ratz to turn and change directions
        if (theSecondRatz.ratzStatus == SBRatzRunningLeft) {
            [theSecondRatz turnRight];
        } else if (theSecondRatz.ratzStatus == SBRatzRunningRight) {
            [theSecondRatz turnLeft];
        }
    }
}
- (void)didEndContact:(SKPhysicsContact *)contact;
{
    NSLog(@"did end contact");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        SBPlayerStatus status = _playerSprite.playerStatus;
        if (!_playerSprite) {
            _playerSprite = [SKBPlayer initNewPlayer:self startingPoint:location];
            [_playerSprite spawnedInScene:self];
            
            // spawn enemy after player 4 second
            SKAction * spawnDelay = [SKAction waitForDuration:4];
            [self runAction:spawnDelay completion:^{
                SKBRat * newEnemy = [SKBRat initNewRatz:self
                                          startingPoint:CGPointMake(50, 280)
                                              ratzIndex:0];
                [newEnemy spawnedInScene:self];
            }];
        } else if (location.y >= (self.frame.size.height / 2 )) {
            // user touched upper half of the screen (zero = bottom of screen)
            if (status != SBPlayerJumpingLeft && status != SBPlayerJumpingRight && status !=
                SBPlayerJumpingUpFacingLeft && status != SBPlayerJumpingUpFacingRight) {
                [_playerSprite jump];
            }
            NSLog(@"X: %f Y: %f height %f",location.x,location.y,(self.frame.size.height / 2 ));
            NSLog(@"jump");
        } else if (location.x <= ( self.frame.size.width / 2 )) {
            // user touched left side of screen
            if (_playerSprite.playerStatus == SBPlayerRunningRight) {
                [_playerSprite skidRight];
            } else if (status == SBPlayerFacingLeft || status == SBPlayerFacingRight) {
                [_playerSprite runLeft];
            }
        } else {
            // user touched right side of screen
            if (_playerSprite.playerStatus == SBPlayerRunningLeft) {
                [_playerSprite skidLeft];
            } else if (status == SBPlayerFacingLeft || status == SBPlayerFacingRight) {
                [_playerSprite runRight];
            }
        }
    }
}
#pragma mark - Node
- (void)addBackgroundNode
{
    NSString * filename = @"";
    if (self.frame.size.width == 480) {
        filename = @"Backdrop_480"; // iphone 3.5-inch
    }else{
        filename = @"Backdrop_568"; // iphone 4-inch
    }
    SKSpriteNode * backdrop = [SKSpriteNode spriteNodeWithImageNamed:filename];
    backdrop.name = @"backdropNode";
    backdrop.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:backdrop];
}
- (void)addBrickBaseNode
{
    // brick base
    brickBase = [SKSpriteNode spriteNodeWithImageNamed:@"Base_600"];
    brickBase.name = @"brickBaseNode";
    brickBase.position = CGPointMake(CGRectGetMidX(self.frame), brickBase.size.height/2);
    brickBase.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:brickBase.size];
    brickBase.physicsBody.categoryBitMask = kBaseCategory;
    brickBase.physicsBody.dynamic = NO;
    [self addChild:brickBase];
}
- (void)update:(NSTimeInterval)currentTime
{
    NSLog(@"update Method!");
    if (!_enemyIsSpawningFlag && _spawnedEnemyCount < 5) {
        _enemyIsSpawningFlag = YES;
        int castIndex = _spawnedEnemyCount;
        int scheduleDelay = 5;
        int leftSideX = CGRectGetMinX(self.frame)+kEnemySpawnEdgeBufferX;
        int rightSideX = CGRectGetMaxX(self.frame)-kEnemySpawnEdgeBufferX;
        int topSideY = CGRectGetMaxY(self.frame)-kEnemySpawnEdgeBufferY;
        int startX = 0;
        // alternate sides for every other spawn
        if (castIndex % 2 == 0)
            startX = leftSideX;
        else
            startX = rightSideX;
        int startY = topSideY;
        // begin delay & when completed spawn new enemy
        SKAction * spacing = [SKAction waitForDuration:scheduleDelay];
        [self runAction:spacing completion:^{
            // create spawn the enemy
            _enemyIsSpawningFlag = NO;
            _spawnedEnemyCount = _spawnedEnemyCount +1;
            SKBRat *newEnemy = [SKBRat initNewRatz:self
                                     startingPoint:CGPointMake(startX, startY)
                                         ratzIndex:castIndex];
            [newEnemy spawnedInScene:self];
        }];
        
    }
}
@end
