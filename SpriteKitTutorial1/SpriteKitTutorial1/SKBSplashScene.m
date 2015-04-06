//
//  SKBMyScene.m
//  Sewer Bros
//
//  Created by admin on 10/19/13.
//  Copyright (c) 2013 Apress. All rights reserved.
//

#import "SKBSplashScene.h"
#import "SKBGameScene.h"
@implementation SKBSplashScene

- (void)didMoveToView:(SKView *)view {
    
    /* Setup your scene here */
    self.backgroundColor = [SKColor blackColor];
    
    NSString *fileName = @"";
    if (self.frame.size.width == 480) {
        fileName = @"SewerSplash_480"; // iPhone Retina (3.5-inch)
    } else {
        fileName = @"SewerSplash_568"; // iPhone Retina (4-inch)
    }
    SKSpriteNode *splash = [SKSpriteNode spriteNodeWithImageNamed:fileName];
    splash.name = @"splashNode";
    splash.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:splash];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    // get node with name
    SKNode *splashNode = [self childNodeWithName:@"splashNode"];
    if (splashNode != nil) {
        splashNode.name = nil;
        // zoom action
        SKAction *zoom = [SKAction scaleTo: 3.0 duration: 1];
        // fade action
        SKAction *fadeAway = [SKAction fadeOutWithDuration: 1];
        // run zoom & face action
        SKAction *grouped = [SKAction group:@[zoom, fadeAway]];
        [splashNode runAction: grouped completion:^{
            // change view when done group actions
            SKBGameScene *nextScene = [[SKBGameScene alloc] initWithSize:self.size];
            // transition with time
            SKTransition *doors = [SKTransition doorwayWithDuration:0.5];
            [self.view presentScene:nextScene transition:doors];
        }]; }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
