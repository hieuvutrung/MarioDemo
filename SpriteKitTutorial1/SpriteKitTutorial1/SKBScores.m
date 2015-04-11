//
//  SKBScores.m
//  SpriteKitTutorial1
//
//  Created by Vu Trung Hieu on 4/11/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import "SKBScores.h"

@implementation SKBScores
- (void)createScoreNumberTextures
{
    NSMutableArray * textureArray = [NSMutableArray arrayWithCapacity:10];
    SKTexture *numberTexture = [SKTexture
                                textureWithImageNamed:kTextNumber0FileName];
    [textureArray insertObject:numberTexture atIndex:0];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber1FileName];
    [textureArray insertObject:numberTexture atIndex:1];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber2FileName];
    [textureArray insertObject:numberTexture atIndex:2];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber3FileName];
    [textureArray insertObject:numberTexture atIndex:3];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber4FileName];
    [textureArray insertObject:numberTexture atIndex:4];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber5FileName];
    [textureArray insertObject:numberTexture atIndex:5];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber6FileName];
    [textureArray insertObject:numberTexture atIndex:6];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber7FileName];
    [textureArray insertObject:numberTexture atIndex:7];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber8FileName];
    [textureArray insertObject:numberTexture atIndex:8];
    numberTexture = [SKTexture textureWithImageNamed:kTextNumber9FileName];
    [textureArray insertObject:numberTexture atIndex:9];
    _arrayOfNumberTextures = [NSArray arrayWithArray:textureArray];
    NSLog(@"NumberTextures created...");

}
- (void)createScoreNodes:(SKScene *)whichScene;
{
    if(!self.arrayOfNumberTextures)
    {
        [self createScoreNumberTextures];
    }
    SKTexture * headerTexture = [SKTexture textureWithImageNamed:kTextPlayerHeaderFileName];
    CGPoint startWhere = CGPointMake(CGRectGetMinY(whichScene.frame)+kScorePlayer1distanceFromLeft, CGRectGetMaxY(whichScene.frame)-kScoreDistanceFromTop);
    //Header
    SKSpriteNode *header = [SKSpriteNode spriteNodeWithTexture:headerTexture];
    header.name = @"score_player_header";
    header.position = startWhere;
    header.xScale = 2;
    header.yScale = 2;
    header.physicsBody.dynamic = NO;
    [whichScene addChild:header];
    
    // Score 5 digits
    SKTexture * textNumberOfTexture = [SKTexture textureWithImageNamed:kTextNumber0FileName];
    for (int index = 0; index< kScoreDigitCount; index++) {
        SKSpriteNode *zero = [SKSpriteNode spriteNodeWithTexture:textNumberOfTexture];
        zero.name = [NSString stringWithFormat:@"score_player_digit%d", index];
        zero.position = CGPointMake(startWhere.x+20+(16*index),
                                    CGRectGetMaxY(whichScene.frame)-kScoreDistanceFromTop);
        zero.xScale = 2;
        zero.yScale = 2;
        
        //disable physics
        zero.physicsBody.dynamic = NO;
        [whichScene addChild:zero];
        
    }
   }
- (void)updateScore:(SKScene *)whichScene newScore:(int)theScore;
{
    NSString *numberString = [NSString stringWithFormat:@"00000%d", theScore];
    NSString *substring = [numberString substringFromIndex:[numberString length]
                           - 5];
    for (int index =1 ; index<=5; index++) {
        [whichScene enumerateChildNodesWithName:[NSString stringWithFormat:@"score_player_digit%d",index] usingBlock:^(SKNode *node, BOOL *stop) {
            NSString *charAtIndex = [substring substringWithRange:NSMakeRange(index -1 , 1)];
            int charIntValue = [charAtIndex intValue];
            SKTexture  *digitTexure = _arrayOfNumberTextures [charIntValue];
            SKAction *newDigit = [SKAction animateWithTextures:@[digitTexure]
                                                  timePerFrame:0.1];
            [node runAction:newDigit];
        }];
    }
}
@end
