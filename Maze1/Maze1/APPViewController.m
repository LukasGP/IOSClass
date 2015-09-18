//
//  APPViewController.m
//  Maze1
//
//  Created by Lukas Prusha on 13-07-03.
//  Copyright (c) 2013 U-Vic. All rights reserved.
//

#import "APPViewController.h"

@interface APPViewController ()

@end

@implementation APPViewController
@synthesize pacman;
@synthesize ghost1;
@synthesize ghost2;
@synthesize ghost3;
@synthesize exit;
@synthesize wall;

- (void)viewDidLoad
{
    
    // Defines the animation for ghost1
    CGPoint origin1 = self.ghost1.center;
    CGPoint target1 = CGPointMake(self.ghost1.center.x, self.ghost1.center.y-124);
    
    CABasicAnimation *bounce1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce1.fromValue = [NSNumber numberWithInt:origin1.y]; // sets the starting point value
    bounce1.toValue = [NSNumber numberWithInt:target1.y]; // sets the end value
    bounce1.duration = 2; // states how long it should take
    bounce1.autoreverses = YES; // tells it to make the return trip
    bounce1.repeatCount = HUGE_VALF; //essentially makes it continue forever
    
    [self.ghost1.layer addAnimation:bounce1 forKey:@"position"];
    
    // Defines the animation for ghost2
    CGPoint origin2 = self.ghost2.center;
    CGPoint target2 = CGPointMake(self.ghost2.center.x, self.ghost2.center.y+284);
    CABasicAnimation *bounce2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce2.fromValue = [NSNumber numberWithInt:origin2.y];
    bounce2.toValue = [NSNumber numberWithInt:target2.y];
    bounce2.duration = 2;
    bounce2.repeatCount = HUGE_VALF;
    bounce2.autoreverses = YES;
    [self.ghost2.layer addAnimation:bounce2 forKey:@"position"];
    
    // Defines the animation for ghost3
    CGPoint origin3 = self.ghost3.center;
    CGPoint target3 = CGPointMake(self.ghost3.center.x - 100, self.ghost3.center.y-284);
    CABasicAnimation *bounce3 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce3.fromValue = [NSNumber numberWithInt:origin3.y];
    bounce3.toValue = [NSNumber numberWithInt:target3.y];
    bounce3.duration = 2;
    bounce3.repeatCount = HUGE_VALF;
    bounce3.autoreverses = YES;
    [self.ghost3.layer addAnimation:bounce3 forKey:@"position"];
    
    // Movement for pacman
    self.lastUpdateTime = [[NSDate alloc] init];
    
    self.currentPoint  = CGPointMake(0, 144);
    self.motionManager = [[CMMotionManager alloc]  init];
    self.queue         = [[NSOperationQueue alloc] init];
    
    self.motionManager.accelerometerUpdateInterval = kUpdateInterval;
    
    [self.motionManager startAccelerometerUpdatesToQueue:self.queue withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error) {
         [(id) self setAcceleration:accelerometerData.acceleration];
         [self performSelectorOnMainThread:@selector(update) withObject:nil waitUntilDone:NO];
     }];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)update {
    
    NSTimeInterval secondsSinceLastDraw = -([self.lastUpdateTime timeIntervalSinceNow]);
    
    self.pacmanYVelocity = self.pacmanYVelocity - (self.acceleration.x * secondsSinceLastDraw);
    self.pacmanXVelocity = self.pacmanXVelocity - (self.acceleration.y * secondsSinceLastDraw);
    
    CGFloat xDelta = secondsSinceLastDraw * self.pacmanXVelocity * 500;
    CGFloat yDelta = secondsSinceLastDraw * self.pacmanYVelocity * 500;
    
    self.currentPoint = CGPointMake(self.currentPoint.x + xDelta,
                                    self.currentPoint.y + yDelta);
    
    [self movePacman];
    
    self.lastUpdateTime = [NSDate date];
    
}

- (void)movePacman {
    
    self.previousPoint = self.currentPoint;
    
    CGRect frame = self.pacman.frame;
    frame.origin.x = self.currentPoint.x;
    frame.origin.y = self.currentPoint.y;
    
    self.pacman.frame = frame;
}

- (void)viewDidUnload
{
    [self setPacman:nil];
    [self setGhost1:nil];
    [self setGhost2:nil];
    [self setGhost3:nil];
    [self setWall:nil];
    [self setExit:nil];
    [self setGhost1:nil];
    [self setGhost2:nil];
    [self setGhost3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
