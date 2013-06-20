//
//  ViewController.m
//  Pjs
//
//  Created by Steve Park on 2013. 6. 20..
//  Copyright (c) 2013년 Steve Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollisionBehaviorDelegate>
{
    UIGravityBehavior* gravityBeahviorPjs;
    UIGravityBehavior* gravityBeahviorKmj;
    
    UICollisionBehavior* collisionBehaviorPjs;
    UICollisionBehavior* collisionBehaviorKmj;
    
    UIImageView *Pjs;
    UIImageView *Kmj;
    
    UIView *viewPjs;
    UIView *viewKmj;
}

@property (nonatomic) UIDynamicAnimator* animatorPjs;
@property (nonatomic) UIDynamicAnimator* animatorKmj;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    viewPjs = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
    [self.view addSubview:viewPjs];
    
    viewKmj = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
    [self.view addSubview:viewKmj];
    
    Pjs = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pjs"]];
    Pjs.center = CGPointMake(Pjs.bounds.size.width/2, self.view.frame.size.height/2);
    Pjs.layer.borderWidth = 2;
    Pjs.layer.borderColor = [UIColor whiteColor].CGColor;
    Pjs.layer.cornerRadius = CGRectGetHeight(Pjs.bounds) / 2;
    Pjs.clipsToBounds = YES;
    
    [viewPjs addSubview:Pjs];
    
    Kmj = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kmj"]];
    Kmj.center = CGPointMake(viewKmj.frame.size.width-Kmj.bounds.size.width/2, self.view.frame.size.height/2);
    Kmj.layer.borderWidth = 2;
    Kmj.layer.borderColor = [UIColor whiteColor].CGColor;
    Kmj.layer.cornerRadius = CGRectGetHeight(Kmj.bounds) / 2;
    Kmj.clipsToBounds = YES;
    
    [viewKmj addSubview:Kmj];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.animatorPjs = [[UIDynamicAnimator alloc] initWithReferenceView:viewPjs];
    self.animatorKmj = [[UIDynamicAnimator alloc] initWithReferenceView:viewKmj];
    
    gravityBeahviorPjs = [[UIGravityBehavior alloc] initWithItems:@[Pjs]];
    gravityBeahviorPjs.xComponent = 0.3f;
    gravityBeahviorPjs.yComponent = 0.0f;
    
    gravityBeahviorKmj = [[UIGravityBehavior alloc] initWithItems:@[Kmj]];
    gravityBeahviorKmj.xComponent = -0.3f;
    gravityBeahviorKmj.yComponent = 0.0f;


    collisionBehaviorPjs = [[UICollisionBehavior alloc] initWithItems:@[Pjs]];
    collisionBehaviorPjs.translatesReferenceBoundsIntoBoundary = YES;
    
    collisionBehaviorKmj = [[UICollisionBehavior alloc] initWithItems:@[Kmj]];
    collisionBehaviorKmj.translatesReferenceBoundsIntoBoundary = YES;
    
    // 애니메이터에 중력속성을 추가.
    [self.animatorPjs addBehavior:gravityBeahviorPjs];
    [self.animatorKmj addBehavior:gravityBeahviorKmj];
    
    // 충돌속성을 추가하고 대리자를 명시함...
    [self.animatorPjs addBehavior:collisionBehaviorPjs];
    [self.animatorKmj addBehavior:collisionBehaviorKmj];
    
    collisionBehaviorPjs.collisionDelegate = self;
    collisionBehaviorKmj.collisionDelegate = self;
    
    
    
}

// 충돌 대리 함수...충돌 시작...
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    // Lighten the background color when the view is in contact with a boundary.
    

}


@end
