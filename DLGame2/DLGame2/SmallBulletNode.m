//
//  SmallBulletNode.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "SmallBulletNode.h"

@implementation SmallBulletNode

-(instancetype)init{
    if ([super init]) {
        self =  [SmallBulletNode spriteNodeWithImageNamed:@"bullet1"];
//        self.position = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.8, [UIScreen mainScreen].bounds.size.height * 0.8);
        self.name = @"SmallBullet";
    }
    return self;
}

@end
