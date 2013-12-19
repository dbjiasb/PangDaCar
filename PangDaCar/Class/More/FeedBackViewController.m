//
//  ScoreViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-18.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "FeedBackViewController.h"
#import "RatingView.h"
#import <QuartzCore/QuartzCore.h>

@interface FeedBackViewController ()
{
    RatingView *starView;
    UITextView *commentTv;
}
@end

@implementation FeedBackViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = RGBCOLOR(240,240,240);
    [self setCustomTitle:@"反馈"];
    [self setBackButton];
    [self initView];
}

-(void)initView
{
    UILabel *titlelabel=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 25.0)] autorelease];
    titlelabel.textColor=[UIColor blackColor];
    titlelabel.backgroundColor=[UIColor clearColor];
    titlelabel.text=@"评分：";
    [self.view addSubview:titlelabel];
    
    starView=[[[RatingView alloc] initWithFrame:CGRectMake(20.0, titlelabel.frame.origin.y+titlelabel.frame.size.height+10.0, 200.0, 35.0)] autorelease];
    [starView setImagesDeselected:@"star_dark.png" partlySelected:@"" fullSelected:@"star_light.png" andDelegate:(id<RatingViewDelegate>)self];
	[starView displayRating:0.0];
    [self.view addSubview:starView];
    
    commentTv=[[UITextView alloc] initWithFrame:CGRectMake(13.0,starView.frame.origin.y+starView.frame.size.height+10.0, 294.0, 150.0)];
    commentTv.delegate=(id<UITextViewDelegate>)self;
    commentTv.backgroundColor=RGBCOLOR(245, 245, 245);
    commentTv.layer.cornerRadius=6.0;
    commentTv.layer.borderWidth=1.0;
    commentTv.font=[UIFont systemFontOfSize:15.0];
    commentTv.layer.borderColor=[RGBCOLOR(222, 222, 222) CGColor];
    [self.view addSubview:commentTv];
    [commentTv release];
    
    UIButton *confirmBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmBtn.frame=CGRectMake(13.0,commentTv.frame.origin.y+commentTv.frame.size.height+10.0, 294.0, 49.0);
    [confirmBtn setTitle:@"提交" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setBackgroundImage:[UIImage imageNamed:@"btnbg"] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font=[UIFont systemFontOfSize:20.0];
    [confirmBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnClick:(id)sender
{
    
}

-(void)ratingChanged:(float)newRating {
    NSLog(@"=====%f",newRating);
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    if([[textView.text stringByReplacingCharactersInRange:range withString:text] length]>140)
    {
        return NO;
    }
    return YES;
}

@end
