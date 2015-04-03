//
//  SKBLedge.m
//  SpriteKitTutorial1
//
//  Created by hieu on 4/3/15.
//  Copyright (c) 2015 hieu. All rights reserved.
//

#import "SKBLedge.h"

@implementation SKBLedge
- (void)createNewSetOfLedgeNodes:(SKScene *)whichScene startingPoint:(CGPoint)leftSide
               withHowManyBlocks:(int)blockCount startingIndex:(int)indexStart;
{
    SKTexture * ledgeBrickTexture = [SKTexture textureWithImageNamed:kLedgeBrickFileName];
    NSMutableArray *nodeArray = [[NSMutableArray alloc] initWithCapacity:blockCount-1];
    CGPoint where = leftSide;
    for (int index = 0; index<blockCount; index++) {
        SKSpriteNode *theNode = [SKSpriteNode spriteNodeWithTexture:ledgeBrickTexture];
        theNode.name = [NSString stringWithFormat:@"ledgeBrick%d", indexStart+index];
        
        // enable/ disable rotation of node
        theNode.physicsBody.allowsRotation = NO;
        
        // setup physics body
        theNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:theNode.size];
        theNode.physicsBody.categoryBitMask = kLedgeCategory;
        
        // designate left & right edge pieces
        // left right not dynamic
        // other block dynamic , user can see when have collision
        if (index == 0) {
            // first node stays solidly in place; anchor point
            theNode.physicsBody.dynamic = NO;
        } else if (index == (blockCount-1)) {
            // last node stays solidly in place; anchor point
            theNode.physicsBody.dynamic = NO;
        } else {
            // all the other nodes inbetween the edge pieces
            theNode.physicsBody.dynamic = YES;
        }
        
        // set up node affect by gravity or no
        theNode.physicsBody.affectedByGravity = NO;
        
        theNode.physicsBody.linearDamping = 1.0;
        theNode.physicsBody.angularDamping = 1.0;
        
        NSLog(@"%@ created", theNode.name);
        theNode.position = where;
        theNode.anchorPoint = CGPointMake(0.5,0.5);
        where.x += kLedgeBrickSpacing;
        [nodeArray insertObject:theNode atIndex:index];
        [whichScene addChild:theNode];
        
    }
    // joints between nodes
    // joints between nodes
    for (int index=0; index <= (blockCount-2); index++) {
        SKSpriteNode *nodeA = [nodeArray objectAtIndex:index];
        SKSpriteNode *nodeB = [nodeArray objectAtIndex:index+1];
        SKPhysicsJointPin *theJoint = [SKPhysicsJointPin jointWithBodyA:nodeA.physicsBody bodyB:nodeB.physicsBody anchor:CGPointMake(nodeB.position.x, nodeB.position.y)];
        theJoint.frictionTorque = 1.0;
        theJoint.shouldEnableLimits = YES;
        theJoint.lowerAngleLimit = 0.0000;
        theJoint.upperAngleLimit = 0.0000;
        [whichScene.physicsWorld addJoint:theJoint];
    }
}
@end
