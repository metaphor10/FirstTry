//
//  AB1DrawView.m
//  FirstTry
//
//  Created by Michael Black on 2/2/13.
//  Copyright (c) 2013 American University. All rights reserved.
//

#import "AB1DrawView.h"
#import "AB1ComponentCircuit.h"
#import "BNRItemStore.h"

@implementation AB1DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
       // UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
       // [self addGestureRecognizer:tapRecognizer];
        point = CGPointMake(0, 0);
        boxesOnScreen = [[NSMutableArray alloc]init];
                
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self setBackgroundColor:[UIColor whiteColor]];
    for (AB1ComponentCircuit *t in [[BNRItemStore sharedStore]allItems]) {
        // Drawing code
        //create a new layer
        CALayer *boxLayer = [[CALayer alloc]init];
        //give it a size
        [boxLayer setBounds:CGRectMake(0.0, 0.0, 85.0, 85.0)];
        //give it a location
        
        [boxLayer setPosition:t.componentPoint];
        //make half transperent red the background
        UIColor *reddish=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
        //get CGColor object with the same color
        CGColorRef cgReddish=[reddish CGColor];
        //Set background of the rect
        [boxLayer setBackgroundColor:cgReddish];
        //create an image file
        
        
        //get the underlaying CGImage
        CGImageRef image=[[t componentImage] CGImage];
        //put the image on the layer
        [boxLayer setContents:(__bridge id)image];
        //inset the image a bit from each side
        [boxLayer setContentsRect:CGRectMake(-0.1, -0.1, 1.2, 1.2)];
        //let the image resize (without changing the aspect ration)
        [boxLayer setContentsGravity:kCAGravityResizeAspect];
        //add the box layer to the array of items on the screen
        
        [[self layer]addSublayer:boxLayer];
    }
 
}
 

-(void)tap:(UITapGestureRecognizer *)gr
{
    NSLog(@"tap");
    
    //AB1ComponentCircuit *component = [[BNRItemStore sharedStore]createItem];
    AB1ComponentCircuit *component=[[[BNRItemStore sharedStore]allItems]lastObject];
    component.componentPoint=[gr locationInView:self];
    [component setComponentImage:[UIImage imageNamed:@"and.png"]];
    
   /*
    // Drawing code
    //create a new layer
    boxLayer = [[CALayer alloc]init];
    //give it a size
    [boxLayer setBounds:CGRectMake(0.0, 0.0, 85.0, 85.0)];
    //give it a location
     point=[gr locationInView:self];
    [boxLayer setPosition:point];
    //make half transperent red the background
    UIColor *reddish=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    //get CGColor object with the same color
    CGColorRef cgReddish=[reddish CGColor];
    //Set background of the rect
    [boxLayer setBackgroundColor:cgReddish];
    //create an image file
    
    UIImage *layerImage=[UIImage imageNamed:@"and.png"];
    //get the underlaying CGImage
    CGImageRef image=[layerImage CGImage];
    //put the image on the layer
    [boxLayer setContents:(__bridge id)image];
    //inset the image a bit from each side
    [boxLayer setContentsRect:CGRectMake(-0.1, -0.1, 1.2, 1.2)];
    //let the image resize (without changing the aspect ration)
    [boxLayer setContentsGravity:kCAGravityResizeAspect];
    //add the box layer to the array of items on the screen
    [boxesOnScreen addObject:boxLayer];*/
    
    [self setNeedsDisplay];
    

}

@end
