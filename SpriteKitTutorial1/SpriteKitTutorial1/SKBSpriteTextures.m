//
//  SKBSpriteTextures.m
//  SpriteKitTutorial1
//
//  Created by hieu on 4/1/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import "SKBSpriteTextures.h"

@implementation SKBSpriteTextures
- (void)createAnimationTextures
{
    // animation arrays
    
    //   right, running
    SKTexture *f1 = [SKTexture textureWithImageNamed:kPlayerRunRight1FileName];
    SKTexture *f2 = [SKTexture textureWithImageNamed:kPlayerRunRight2FileName];
    SKTexture *f3 = [SKTexture textureWithImageNamed:kPlayerRunRight3FileName];
    SKTexture *f4 = [SKTexture textureWithImageNamed:kPlayerRunRight4FileName];
    _playerRunRightTextures = @[f1,f2,f3,f4];
    
    //   right, skidding
    f1 = [SKTexture textureWithImageNamed:kPlayerSkidRightFileName];
    _playerSkiddingRightTextures = @[f1];
    
    //   right, still
    f1 = [SKTexture textureWithImageNamed:kPlayerStillRightFileName];
    _playerStillFacingRightTextures = @[f1];
    
    //   right, jumping
    f1 = [SKTexture textureWithImageNamed:kPlayerJumpRightFileName];
    _playerJumpRightTextures = @[f1];
    //   left, running
    f1 = [SKTexture textureWithImageNamed:kPlayerRunLeft1FileName];
    f2 = [SKTexture textureWithImageNamed:kPlayerRunLeft2FileName];
    f3 = [SKTexture textureWithImageNamed:kPlayerRunLeft3FileName];
    f4 = [SKTexture textureWithImageNamed:kPlayerRunLeft4FileName];
    _playerRunLeftTextures = @[f1,f2,f3,f4];
    
    //   left, skidding
    f1 = [SKTexture textureWithImageNamed:kPlayerSkidLeftFileName];
    _playerSkiddingLeftTextures = @[f1];
    
    //   left, still
    f1 = [SKTexture textureWithImageNamed:kPlayerStillLeftFileName];
    _playerStillFacingLeftTextures = @[f1];
    
    //   left, jumping
    f1 = [SKTexture textureWithImageNamed:kPlayerJumpLeftFileName];
    _playerJumpLeftTextures = @[f1];
    
    // Rat
    //  right, running
    f1 = [SKTexture textureWithImageNamed:kRatzRunRight1FileName];
    f2 = [SKTexture textureWithImageNamed:kRatzRunRight2FileName];
    f3 = [SKTexture textureWithImageNamed:kRatzRunRight3FileName];
    f4 = [SKTexture textureWithImageNamed:kRatzRunRight4FileName];
    SKTexture *f5 = [SKTexture textureWithImageNamed:kRatzRunRight5FileName];
    _ratzRunRightTextures = @[f1,f2,f3,f4,f5];
    // left, running
    f1 = [SKTexture textureWithImageNamed:kRatzRunLeft1FileName];
    f2 = [SKTexture textureWithImageNamed:kRatzRunLeft2FileName];
    f3 = [SKTexture textureWithImageNamed:kRatzRunLeft3FileName];
    f4 = [SKTexture textureWithImageNamed:kRatzRunLeft4FileName];
    f5 = [SKTexture textureWithImageNamed:kRatzRunLeft5FileName];
    _ratzRunLeftTextures = @[f1,f2,f3,f4,f5];
}

@end
