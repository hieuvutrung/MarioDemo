//
//  SKBRat.m
//  SpriteKitTutorial1
//
//  Created by hieu on 4/6/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import "SKBRat.h"
#import "SKBGameScene.h"

@implementation SKBRat
+ (SKBRat *)initNewRatz:(SKScene *)whichScene startingPoint:(CGPoint)location
              ratzIndex:(int)index;
{
    SKTexture * ratzTexture = [SKTexture textureWithImageNamed:kRatzRunRight1FileName];
    SKBRat * ratz = [SKBRat spriteNodeWithTexture:ratzTexture];
    ratz.name = [NSString stringWithFormat:@"ratz%d",index];
    ratz.position = location;
    ratz.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ratz.size];
    ratz.physicsBody.categoryBitMask = kRatzCategory;
    ratz.physicsBody.contactTestBitMask = kWallCategory | kBaseCategory | kRatzCategory;
    ratz.physicsBody.collisionBitMask = kBaseCategory | kWallCategory | kLedgeCategory | kRatzCategory;
    ratz.physicsBody.density = 1.0;
    ratz.physicsBody.linearDamping = 0.1;
    ratz.physicsBody.restitution = 0.2;
    ratz.physicsBody.allowsRotation = NO;
    [whichScene addChild:ratz];
    return ratz;
}
- (void)spawnedInScene:(SKScene *)whichScene;
{
    SKBGameScene * gameScene = (SKBGameScene*)whichScene;
    self.spriteTextures = gameScene.spriteTextures;
    // set initial direction and start moving
    if (self.position.x < CGRectGetMidX(whichScene.frame)) {
        [self runRight];
    }else{
        [self runLeft];
    }
}
- (void)wrapRatz:(CGPoint)where;
{
    SKPhysicsBody *storePB = self.physicsBody;
    self.physicsBody = nil;
    self.position = where;
    self.physicsBody = storePB;
    
}
- (void)runRight;
{
    // set type of status
    self.ratzStatus = SBRatzRunningRight;
    // create animation
    SKAction *runRightAction = [SKAction animateWithTextures:self.spriteTextures.ratzRunRightTextures timePerFrame:0.05];
    SKAction *walkForever = [SKAction repeatActionForever:runRightAction];
    [self runAction:walkForever];
    // move right animation
    SKAction *moveRight = [SKAction moveByX:kRatzRunningIncrement y:0 duration:1];
    SKAction *moveForever = [SKAction repeatActionForever:moveRight];
    [self runAction:moveForever];
}
- (void)runLeft;
{
    self.ratzStatus = SBRatzRunningLeft;
    SKAction * runLeftAction = [SKAction animateWithTextures:self.spriteTextures.ratzRunLeftTextures timePerFrame:0.05];
    SKAction * walkForever = [SKAction repeatActionForever:runLeftAction];
    [self runAction:walkForever];
    
    SKAction * moveLeft = [SKAction moveByX:-kRatzRunningIncrement y:0 duration:1];
    SKAction * moveLeftForever = [SKAction repeatActionForever:moveLeft];
    [self runAction:moveLeftForever];
}
- (void)turnRight
{
    self.ratzStatus = SBRatzRunningRight;
    [self removeAllActions];
    SKAction *moveRight = [SKAction moveByX:5 y:0 duration:0.4];
    [self runAction:moveRight completion:^{[self runRight];}];
}
- (void)turnLeft
{
    self.ratzStatus = SBRatzRunningLeft;
    [self removeAllActions];
    SKAction *moveLeft = [SKAction moveByX:-5 y:0 duration:0.4];
    [self runAction:moveLeft completion:^{[self runLeft];}];
}
@end
