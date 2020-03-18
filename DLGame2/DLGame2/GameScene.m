//
//  GameScene.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/18.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

-(instancetype)initWithSize:(CGSize)size{
    if ([super initWithSize:size]) {
        self.backgroundColor = [SKColor redColor];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    
}

@end
