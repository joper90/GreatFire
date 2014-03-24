//
//  IntroScene.m
//  GreatFire
//
//  Created by Joe on 23/03/2014.
//  Copyright com.funkVoodoo 2014. All rights reserved.
//
// -----------------------------------------------------------------------

// Import the interfaces
#import "IntroScene.h"
#import "StartStreet.h"

// -----------------------------------------------------------------------
#pragma mark - IntroScene
// -----------------------------------------------------------------------

@implementation IntroScene

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (IntroScene *)scene
{
	return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    // Create a colored background (Dark Grey)
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.5f green:0.0f blue:0.0f alpha:1.0f]];
    [self addChild:background];
    
    // Hello world
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Great Fire of London" fontName:@"Firestarter" fontSize:72.0f];
    label.positionType = CCPositionTypeNormalized;
    label.color = [CCColor yellowColor];
    label.position = ccp(0.5f, 0.5f); // Middle of screen
    [self addChild:label];
    
    //Ava Humphries lable
    CCLabelTTF *avalabel = [CCLabelTTF labelWithString:@"Ava Humphries" fontName:@"Firestarter" fontSize:32.0f];
    avalabel.positionType = CCPositionTypeNormalized;
    avalabel.color = [CCColor orangeColor];
    avalabel.position = ccp(0.5f, 0.35f); // Middle of screen
    [self addChild:avalabel];
    
    
    // Helloworld scene button
    CCButton *helloWorldButton = [CCButton buttonWithTitle:@"[ Start ]" fontName:@"Firestarter" fontSize:18.0f];
    helloWorldButton.positionType = CCPositionTypeNormalized;
    helloWorldButton.position = ccp(0.5f, 0.25f);
    [helloWorldButton setTarget:self selector:@selector(onSpinningClicked:)];
    [self addChild:helloWorldButton];

    
    //Add the fire effect and shove to the back of the scene...
    CCParticleSystem* partSystem = [CCParticleSystem particleWithFile:@"firePart.plist"];
    [self addChild:partSystem];
    
    // done
	return self;
}

// -----------------------------------------------------------------------
#pragma mark - Button Callbacks
// -----------------------------------------------------------------------

- (void)onSpinningClicked:(id)sender
{
    [[CCDirector sharedDirector] replaceScene: [StartStreet scene] withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:1.0f]];
}

// -----------------------------------------------------------------------
@end
