//
//  GameViewController.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/18.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "GameViewController.h"
#import "MainScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainScene *scene = [[MainScene alloc]initWithSize:self.view.frame.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    SKView *skView = (SKView *)self.view;
    [skView presentScene:scene];
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
