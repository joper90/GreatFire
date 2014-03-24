//
//  Button.m
//  GreatFire
//
//  Created by Joe on 24/03/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "Button.h"


@implementation Button
@synthesize sceneToMoveToo;

-(void) onEnter
{
    self.userInteractionEnabled = YES;
}

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCLOG(@"Touched Button +  %@", [self name]);
    [[CCDirector sharedDirector] replaceScene: sceneToMoveToo withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0f]];
}


@end
