//
//  MarqueeScrollView.m
//  InvestorApp
//
//  Created by Srikanth on 7/30/13.
//  Copyright (c) 2013 MobileShareHolder. All rights reserved.
//

#import "MarqueeScrollView.h"

@implementation MarqueeScrollView

/*
Can be modified to have configurable speed, height & width
 separtor also 
 
 
 
 */



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentSize = CGSizeMake(5000, 20);
      
        
        //Test Code--------
        NSMutableArray *array=[[NSMutableArray alloc] init];
        for (int i=0;i<50; i++) {
            
            UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 20, 5, 20)];
            view.backgroundColor=[UIColor redColor];
            
            [array addObject:view];
            
        }

        [self addViews:array];
        //Test Code--------
        
        NSLog(@"%@",self.subviews);
        
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(changePosition)  userInfo:nil repeats:YES];

    }
    return self;
}

-(void)addViews:(NSArray *)views{

    int seperator=10;
    int previousXend=0;
    for (int i=0; i<[views count];i++) {
        
        UIView *view=[[UIView alloc] init];
        view=[views objectAtIndex:i];
        view.frame=CGRectMake(previousXend+ i*seperator, 20, view.frame.size.width, 20);
        previousXend=previousXend+view.frame.size.width;
        
        [self addSubview:view];
    }
    
    
}


-(void)changePosition{
    
    [self setContentOffset:CGPointMake(self.contentOffset.x+10,self.contentOffset.y) animated:YES];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
