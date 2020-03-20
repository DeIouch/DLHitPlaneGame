//
//  Header.h
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#ifndef Header_h
#define Header_h

static inline CGVector DLVectorMultiply(CGVector v, CGFloat m){
    return CGVectorMake(v.dx * m, v.dy * m);
}

static inline CGVector DLVectorBetweenPoints(CGPoint p1, CGPoint p2) {
    return CGVectorMake(p2.x - p1.x, p2.y - p1.y);
}

static inline CGFloat DLVectorLength(CGVector v){
    return sqrtf(powf(v.dx, 2) + powf(v.dy, 2));
}

static inline CGFloat DLPointDistance(CGPoint p1, CGPoint p2){
    return sqrtf(powf(p2.x - p1.x, 2) + powf(p2.y - p1.y, 2));
}



typedef NS_OPTIONS(uint32_t, DLPhysicsCategory) {
    UserPhysicsCategory                                 =   1 << 1,
    EnemySoldierPhysicsCategory                     =   1 << 2,
    EnemyBossPhysicsCategory                        =   1 << 3,
    UserSmallBulletPhysicsCategory                  =   1 << 4,
    UserBigBulletPhysicsCategory                     =   1 << 5,
    EnemySoldierSmallBulletPhysicsCategory      =   1 << 6,
    EnemySoldierBigBulletPhysicsCategory         =   1 << 7,
    EnemyBossSmallBulletPhysicsCategory         =   1 << 8,
    EnemyBossBigBulletPhysicsCategory            =   1 << 9,
};



#endif /* Header_h */
