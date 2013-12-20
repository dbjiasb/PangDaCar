//
//  MyUtil.m
//  HotelManager
//
//  Created by Dragon Huang on 13-4-26.
//  Copyright (c) 2013年 baiwei.Yuan Wen. All rights reserved.
//

#import "MyUtil.h"
#import <objc/runtime.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <QuartzCore/QuartzCore.h>

#pragma mark - StringUtils

@implementation StringUtils
+ (BOOL)isEmptyOrNull:(NSString *)string
{
    
    BOOL isEmptyOrNull = YES;
    if (![string isEqual:[NSNull null]] && string != nil && string.length != 0) {
        NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
        NSArray *parts = [string componentsSeparatedByString:@" "];
        NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
        string = [filteredArray componentsJoinedByString:@""];
        if (string.length > 0) {
            isEmptyOrNull = NO;
        }
    }
    return isEmptyOrNull;
}
@end

@implementation UIImage (HL_Utilities)

+ (UIImage *)imageWithJPGName:(NSString *)name
{
    NSString *path = nil;
    if ( [name isAbsolutePath] ) {
        path = name;
    } else {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"jpg"];
    }
    return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *)imageUtilName:(NSString *)name
{
    NSString *path = nil;
    if ( [name isAbsolutePath] ) {
        path = name;
    } else {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    }
    return [UIImage imageWithContentsOfFile:path];
}

- (UIImage *)stretchableImage
{
    CGFloat hSpacing = floor((self.size.width+1.0)/2.0)-1.0;
    hSpacing = MAX(0.0, hSpacing);
    CGFloat vSpacing = floor((self.size.height+1.0)/2.0)-1.0;
    vSpacing = MAX(0.0, vSpacing);
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(vSpacing, hSpacing, vSpacing, hSpacing);
    return [self stretchableImageWithCapInsets:edgeInsets];
}

- (UIImage *)stretchableImageWithCenterSize:(CGSize)centerSize
{
    CGFloat hSpacing = floor((self.size.width - centerSize.width)/2.0);
    CGFloat vSpacing = floor((self.size.height - centerSize.height)/2.0);
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(vSpacing, hSpacing, vSpacing, hSpacing);
    return [self stretchableImageWithCapInsets:edgeInsets];
}

- (UIImage *)stretchableImageWithCapInsets:(UIEdgeInsets)capInsets
{
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(floor(capInsets.top),
                                               floor(capInsets.left),
                                               floor(capInsets.bottom),
                                               floor(capInsets.right));
    
    CGFloat systemVersion = [[[[UIDevice class] currentDevice] systemVersion] floatValue];
    if ( systemVersion < 5.0 ) {
        return [self stretchableImageWithLeftCapWidth:edgeInsets.left topCapHeight:edgeInsets.top];
    }
    //NSLog(@"%f,%f,%f,%f",edgeInsets.top,edgeInsets.left,edgeInsets.bottom,edgeInsets.right);
    return [self resizableImageWithCapInsets:edgeInsets];
}

- (UIImage *)scaleImageWithScale:(float)scaleSize {
    
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width * scaleSize, self.size.height * scaleSize));
    [self drawInRect:CGRectMake(0, 0, self.size.width * scaleSize, self.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)tintedImageUsingColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(self.size);
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    [self drawInRect:rect];
    
    [color set];
    UIRectFillUsingBlendMode(rect, kCGBlendModeSourceAtop);
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

- (UIImage *)resizeWithSize:(CGSize)newSize
{
    
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}



@end

#pragma mark - UIButton (DH_Utilities)

@implementation UIButton (DH_Utilities)

static char const * const sectionKey = "kUIButtonSectionKey";

@dynamic section;

- (int)section{
    NSNumber *section = objc_getAssociatedObject(self, sectionKey);
    return [section intValue];
}

- (void)setSection:(int)section
{
    objc_setAssociatedObject(self, sectionKey, [NSNumber numberWithInt:section], OBJC_ASSOCIATION_ASSIGN);
}

- (void)setNormalTitle:(NSString *)normalTitle
{
    [self setTitle:normalTitle forState:UIControlStateNormal];
}

- (void)setHighlightedTitle:(NSString *)highlightedTitle
{
    [self setTitle:highlightedTitle forState:UIControlStateHighlighted];
}

- (void)setDisabledTitle:(NSString *)disabledTitle
{
    [self setTitle:disabledTitle forState:UIControlStateDisabled];
}

- (void)setSelectedTitle:(NSString *)selectedTitle
{
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

- (void)setNormalImage:(UIImage *)normalImage
{
    [self setImage:normalImage forState:UIControlStateNormal];
}

- (void)setHighlightedImage:(UIImage *)highlightedImage
{
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
    [self setImage:selectedImage forState:UIControlStateSelected];
}

- (void)setNormalBgImage:(UIImage *)normalBackgroundImage
{
    [self setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
}

- (void)setHighlightedBgImage:(UIImage *)highlightedBackgroundImage
{
    [self setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
}

- (void)setDisabledBgImage:(UIImage *)disabledBackgroundImage
{
    [self setBackgroundImage:disabledBackgroundImage forState:UIControlStateDisabled];
}

- (void)setSelectedBgImage:(UIImage *)selectedBackgroundImage
{
    [self setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor
{
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
}

- (void)setHighlightedTitleColor:(UIColor *)highlightedTitleColor
{
    [self setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
}

- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor
{
    [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
}

- (UIColor *)normalTitleShadowColor
{
    return [self titleShadowColorForState:UIControlStateNormal];
}
- (void)setNormalTitleShadowColor:(UIColor *)normalTitleShadowColor
{
    [self setTitleShadowColor:normalTitleShadowColor forState:UIControlStateNormal];
}

- (UIColor *)highlightedTitleShadowColor
{
    return [self titleShadowColorForState:UIControlStateHighlighted];
}
- (void)setHighlightedTitleShadowColor:(UIColor *)highlightedTitleShadowColor
{
    [self setTitleShadowColor:highlightedTitleShadowColor forState:UIControlStateHighlighted];
}

- (UIColor *)disabledTitleShadowColor
{
    return [self titleShadowColorForState:UIControlStateDisabled];
}
- (void)setDisabledTitleShadowColor:(UIColor *)disabledTitleShadowColor
{
    [self setTitleShadowColor:disabledTitleShadowColor forState:UIControlStateDisabled];
}

- (UIColor *)selectedTitleShadowColor
{
    return [self titleShadowColorForState:UIControlStateSelected];
}
- (void)setSelectedTitleShadowColor:(UIColor *)selectedTitleShadowColor
{
    [self setTitleShadowColor:selectedTitleShadowColor forState:UIControlStateSelected];
}

- (void)setControlStateTitleColor:(UIColor *)stateTitleColor
{
    [self setNormalTitleColor:stateTitleColor];
    [self setHighlightedTitleColor:stateTitleColor];
    [self setSelectedTitleColor:stateTitleColor];
}

- (void)touchUpInsideTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchDownTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

- (void)touchUpOutsideTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpOutside];
}

@end

#pragma mark - UIImageView (DH_Utilities)

@implementation UIImageView (GD10000_Utilities)

- (void)setImageName:(NSString *)imageName
{
    NSString *path = nil;
    if ( [imageName isAbsolutePath] ) {
        path = imageName;
    } else {
        path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    }
    
    UIImage *newImage = [[UIImage alloc] initWithContentsOfFile:path];
    self.image = newImage;
    [newImage release];
}

@end

#pragma mark - NSString (DH_Utilities)

@implementation NSString (GD10000_Utilities)

- (CGFloat)widthWithFont:(UIFont *)font
{
    CGSize size = [self sizeWithFont:font];
    CGFloat width = size.width;
    return width;
}

- (CGFloat)heightWithFont:(UIFont *)font
{
    CGSize size = [self sizeWithFont:font];
    CGFloat height = size.height;
    return height;
}

- (CGFloat)heightForLineWidth:(CGFloat)width font:(UIFont *)font
{
    CGSize size = [self sizeWithFont:font
                   constrainedToSize:CGSizeMake(width, 30000000.0f)
                       lineBreakMode:NSLineBreakByWordWrapping];
    return size.height;
}

- (BOOL)isEmptyOrNull
{
    BOOL isEmptyOrNull = YES;
    if (![self isEqual:[NSNull null]] && self != nil && self.length != 0) {
        NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
        NSArray *parts = [self componentsSeparatedByString:@" "];
        NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
        self = [filteredArray componentsJoinedByString:@""];
        if (self.length > 0) {
            isEmptyOrNull = NO;
        }
    }
    return isEmptyOrNull;
}

- (NSString *)subStringAtLoc:(NSInteger)loc leng:(NSInteger)len
{
    return [self substringWithRange:NSMakeRange(loc, len)];
}

@end

#pragma mark - UIView (DH_Utilities)

@implementation UIView (HL_Utilities)

- (void)addSwipeWithTarget:(id)target action:(SEL)action
{
    UISwipeGestureRecognizer *recognizer;
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:recognizer];
    recognizer.delegate = target;
	[recognizer release];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:action];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:recognizer];
    [recognizer release];
}

- (void)removeAllSubviews
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

@end

#pragma mark - UINavigationController

@implementation UINavigationController (HL_Utilities)
- (void)setBgImageName:(NSString *)name
{
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:name] forBarMetrics:UIBarMetricsDefault];
        
    }
}
@end

@implementation UINavigationItem (HL_Utilities)

- (void)setCustomTitle:(NSString *)name
{
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
    title.textColor = RGBCOLOR(80, 103, 116);
    title.text = name;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont boldSystemFontOfSize:22];
    title.backgroundColor = [UIColor clearColor];
    self.titleView = title;
    [title release];
}

@end

@implementation UINavigationBar (HL_Utilities)

- (void)drawRect:(CGRect)rect {
    
    [[self barBackground] drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height )];
	
	
}
- (UIImage *)barBackground
{
    NSLog(@"%f,%f",self.frame.size.width,self.frame.size.height);
    
    if (self.frame.size.width < 321)
    {
        return [UIImage imageNamed:@"bg_navi"];
    }
    else
    {
        return [UIImage imageNamed:@"navibar_bg_lands-568h"];
    }
    
    
}

- (void)didMoveToSuperview
{
    //iOS5 only
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
    {
        //UIBarStyleDefault
        [self setBackgroundImage:[self barBackground] forBarMetrics:UIBarMetricsDefault];
    }
    [self setNeedsDisplay];
}

@end

@implementation UIViewController (Utilities)

- (void)setBackBarBtnImage
{
    if ([MyUtil isIOS7OrLater])
    {
        UIBarButtonItem *backItem = [[[UIBarButtonItem alloc] init] autorelease];
        self.navigationItem.backBarButtonItem = backItem;
        backItem.title = @"返回";
        
        return;
    }
    UIBarButtonItem *backBarButton = [[[UIBarButtonItem alloc] init] autorelease];
    [backBarButton setBackButtonBackgroundImage:[[UIImage imageNamed:@"btn_back_home"] resizableImageWithCapInsets:UIEdgeInsetsMake(14, 14, 15, 4)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //    [backBarButton setBackButtonBackgroundImage:[[UIImage imageUtilName:@"emark_backbtn_down"] resizableImageWithCapInsets:UIEdgeInsetsMake(14, 14, 15, 4)] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = backBarButton;
}

- (void)setBackButton
{
    if (self.navigationController.viewControllers[0] == self)
    {
        [self setLeftBarBtnName:/*@"首页"*/@"返回"];
    }
    else
    {
        if (![MyUtil isIOS7OrLater])
        {
            [self setLeftBarBtnName:@"返回"];
        }
    }
}

- (void)setbackToLastBtn
{
    [self setLeftBarBtnName:@"返回"];
}

- (void)setBackToHomeBtn
{
    [self setLeftBarBtnName:/*@"首页"*/@"返回"];
}

- (void)setLeftBarBtnName:(NSString *)title
{
    self.navigationItem.leftBarButtonItem = [self barBtnWithTitle:title action:@selector(back)];
    
    //    if ([MyUtil isIOS7OrLater])
    //    {
    ////        [[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonSystemItemSave target:self action:@selector(back)] autorelease];
    //    }
    //    else
    //    {
    //        UIBarButtonItem *leftBarBtn = [UIBarButtonItem buttonWithTitle:title imageName:@"btn_back_home" target:self action:@selector(back)];
    //        self.navigationItem.leftBarButtonItem = leftBarBtn;
    //    }
    
}


- (UIBarButtonItem *)barBtnWithTitle:(NSString *)title action:(SEL)selector
{
    if ([MyUtil isIOS7OrLater])
    {
        return [[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:self action:selector] autorelease];
    }
    else
    {
        return [UIBarButtonItem buttonWithTitle:title imageName:@"btn_back_home" target:self action:selector];
    }
}


- (void)setRightBarBtnName:(NSString *)title selector:(SEL)sel
{
    self.navigationItem.rightBarButtonItem  = [self barBtnWithTitle:title action:sel];
    //    if ([MyUtil isIOS7OrLater])
    //    {
    //        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonSystemItemSave target:self action:sel] autorelease];
    //    }
    //    else
    //    {
    //        UIBarButtonItem *leftBarBtn = [UIBarButtonItem buttonWithTitle:title imageName:@"btn_back_home" target:self action:sel];
    //        self.navigationItem.rightBarButtonItem = leftBarBtn;
    //    }
}

- (void)back
{
    NSLog(@"%p---%p",self.navigationController.viewControllers[0],self);
    if (self.navigationController.viewControllers[0] == self)
    {
        
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setCustomTitle:(NSString *)name
{
    //
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UILabel *title = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 25)] autorelease];
    title.textColor = RGBCOLOR(80, 103, 116);
    title.text = name;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont boldSystemFontOfSize:22];
    title.backgroundColor = [UIColor clearColor];
    title.textColor=[UIColor blackColor];
    self.navigationItem.titleView = title;
    
}

- (void)setLandscapeTitle:(NSString *)name
{
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UILabel *title = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 25)] autorelease];
    title.textColor = RGBCOLOR(80, 103, 116);
    title.text = name;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont boldSystemFontOfSize:17];
    title.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = title;
    
}


- (void)loadNormalBG
{
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, -64, 320, [MyUtil viewHeight] + 20)];
    bg.image = [UIImage imageNamed:@"bg_subviews"];
    [self.view insertSubview:bg atIndex:0];
    [bg release];
}

@end
#pragma mark - NSDate (DH_Utilities)

@implementation NSDate (DH_Utilities)

- (NSString *)timeString
{
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [df stringFromDate:self];
    
    return dateString;
}

- (NSString *)dateString
{
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [df stringFromDate:self];
    
    return dateString;
}


//month个月后的日期
- (NSDate *)dateafterMonth:(int)month
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	[componentsToAdd setMonth:month];
	NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	[componentsToAdd release];
	
	return dateAfterMonth;
}

//返回day天后的日期(若day为负数,则为|day|天前的日期)
- (NSDate *)dateAfterDay:(int)day
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	// NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	// to get the end of week for a particular date, add (7 - weekday) days
	[componentsToAdd setDay:day];
	NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	[componentsToAdd release];
	
	return dateAfterDay;
}

//获取月
- (NSUInteger)getMonth
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:self];
	return [dayComponents month];
}

//获取年
- (NSUInteger)getYear
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:self];
	return [dayComponents year];
}

//获取日
- (NSUInteger)getDay{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:self];
	return [dayComponents day];
}

//返回该月的第一天
- (NSDate *)beginningOfMonth
{
	return [self dateAfterDay:-[self getDay] + 1];
}

//该月的最后一天
- (NSDate *)endOfMonth
{
	return [[[self beginningOfMonth] dateafterMonth:1] dateAfterDay:-1];
}

//返回一周的第几天(周末为第一天)
- (NSUInteger)weekday {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *weekdayComponents = [calendar components:(NSWeekdayCalendarUnit) fromDate:self];
	return [weekdayComponents weekday];
}

//是闰年
- (BOOL)isLeapYear
{
    BOOL isLeapYear = NO;
    
    int year = [self getYear];
    //被400乘除
    if (year % 400 == 0 )
    {
        isLeapYear = YES;
    }
    else
    {
        //不被100整除但被4整除
        if (year % 100 != 0 && year % 4 == 0) {
            isLeapYear = YES;
        }
    }
    
    return isLeapYear;
}

@end

#pragma mark - MyUtil

@implementation MyUtil

+ (UIButton *)buttonWithFrame:(CGRect)frame
                       target:target
                  title:(NSString *)title
                 action:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+ (id)chkUpdateEventHandle:(id)handle
{
    //获得当前版本号
    UpgradeReq *req = [[[UpgradeReq alloc] init] autorelease];
    req.method = @"GET";
    
    NSString *name = Invoke_Name_Upgrade;
    
    id voucher = [DHServiceInvocation invokeWithNAME:name
                                        requestMsg:req
                                       eventHandle:(id<ServiceInvokeHandle>)handle];
    
    return voucher;
}


+ (BOOL)isValidURL:(NSString *)urlString
{
    
    NSString * regex = @"(https?:\\/\\/)?([A-Za-z0-9\\.-]+\\.[A-Za-z]{2,3}|\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})(\\/[A-Za-z0-9\\._]*)*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:urlString];
    
    return isMatch;
}

+ (id)getObjectFromClassName:(NSString *)className
{
    Class cls = NSClassFromString(@"LoginViewController");
    
    return [[[[cls class] alloc] init] autorelease];
}

//判断本地网络是否打开
+(BOOL)checkNetIsConnect
{
    SCNetworkReachabilityFlags flags;
    BOOL receivedFlags;
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [@"dipinkrishna.com" UTF8String]);
    receivedFlags = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);
    
    if (!receivedFlags || (flags == 0) )
    {
        return FALSE;
    } else {
        return TRUE;
    }
}

+(float)screenWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}
+(float)screenHeight
{
    return [[UIScreen mainScreen] bounds].size.height - 20;
    
}
+ (CGRect)screenFrame
{
    return [[UIScreen mainScreen] bounds];
}
+ (float)viewHeight
{
    return [self screenHeight];
}

+ (NSString *)timeIntervalString
{
    NSDate* now = [NSDate date];

    NSTimeInterval timeIntervalString = [now timeIntervalSince1970];
 
    return [NSString stringWithFormat:@"%.0lf",timeIntervalString];
}

+(NSString *)GetNowTime{
    
    NSDateFormatter *tempDate = [[[NSDateFormatter alloc]init] autorelease];
    [tempDate setLocale:[NSLocale currentLocale]];
    
    [tempDate setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//24小时制
    
    NSDate* now = [NSDate date];
    NSString *tempDatestring = [tempDate stringFromDate:now];
    
    
    return tempDatestring;
    //    //NSLog(@"time.....%@",now);
}

+(NSString *)GetNowDate
{
    NSDateFormatter *tempDate = [[[NSDateFormatter alloc]init] autorelease];
    [tempDate setLocale:[NSLocale currentLocale]];
    
    [tempDate setDateFormat:@"yyyy-MM-dd"];//
    
    NSDate* now = [NSDate date];
    NSString *tempDatestring = [tempDate stringFromDate:now];
    
    
    return tempDatestring;
    //    //NSLog(@"time.....%@",now);
}

+(NSString *)GetNowYear
{
    NSDateFormatter *tempDate = [[[NSDateFormatter alloc]init] autorelease];
    [tempDate setLocale:[NSLocale currentLocale]];
    
    [tempDate setDateFormat:@"yyyy年"];//
    
    NSDate* now = [NSDate date];
    NSString *tempDatestring = [tempDate stringFromDate:now];
    
    
    return tempDatestring;
    //    //NSLog(@"time.....%@",now);
}

+(NSString *)GetNowYearAndMonth
{
    NSDateFormatter *tempDate = [[[NSDateFormatter alloc]init] autorelease];
    [tempDate setLocale:[NSLocale currentLocale]];
    
    [tempDate setDateFormat:@"yyyy年MM月"];//
    
    NSDate* now = [NSDate date];
    NSString *tempDatestring = [tempDate stringFromDate:now];
    
    
    return tempDatestring;
    //    //NSLog(@"time.....%@",now);
}


+ (NSString *)threeDaysAfter
{
    NSDateFormatter *tempDate = [[[NSDateFormatter alloc]init] autorelease];
    [tempDate setLocale:[NSLocale currentLocale]];
    
    [tempDate setDateFormat:@"yyyy-MM-dd"];//
    
    NSDate* threeDaysAfter = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * 2];
    NSString *tempDatestring = [tempDate stringFromDate:threeDaysAfter];
    
    
    return tempDatestring;
}

+ (NSString *)dayStringAfter:(int )days
{
    NSDateFormatter *tempDate = [[[NSDateFormatter alloc]init] autorelease];
    [tempDate setLocale:[NSLocale currentLocale]];
    
    [tempDate setDateFormat:@"yyyy-MM-dd"];//
    
    NSDate* threeDaysAfter = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * days];
    NSString *tempDatestring = [tempDate stringFromDate:threeDaysAfter];
    
    
    return tempDatestring;
}

+ (BOOL)isIphone5
{
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO);
}

+ (BOOL)isIOS7OrLater
{
    return [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0;
}

+ (void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:message delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

+ (UIAlertView *)showAlert:(NSString *)message
         delegate:(id <UIAlertViewDelegate>)delegate
          button1:(NSString *)button1
          button2:(NSString *)button2
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:message delegate:delegate
                                          cancelButtonTitle:button1
                                          otherButtonTitles:button2, nil];
    
    [alert show];
    return [alert autorelease];
}

+ (void)showAlert:(NSString *)message
         delegate:(id <UIAlertViewDelegate>)delegate
           button:(NSString *)button
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:message delegate:delegate
                                          cancelButtonTitle:button
                                          otherButtonTitles:nil, nil];
    
    [alert show];
    [alert release];
}

+ (void)showAlert:(NSString *)message delegate:(id <UIAlertViewDelegate>)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:message delegate:delegate
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    
    [alert show];
    [alert release];
}

+ (void)showMessageBox:(NSString *)message
{
    if ([theAppWindow viewWithTag:99999]) {
        [[theAppWindow viewWithTag:99999] removeFromSuperview];
    }
    [self initAlertLabel:message hidden:YES];
}

+ (void)initAlertLabel:(NSString *)message hidden:(BOOL)hidden
{
    UIFont *font = [UIFont systemFontOfSize:14];
    //CGFloat width = [message widthWithFont:font];
    CGFloat height = [message heightForLineWidth:300 font:font];
    if (height > 30) {
        height+= 10;
    }else {
        height = 30;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 64, 300, height)];
    label.backgroundColor = [UIColor grayColor];
    label.alpha = 1.0;
    label.text = message;
    label.font = font;
    label.layer.cornerRadius = 5.0f;
    label.layer.masksToBounds = YES;
    label.layer.borderColor = [[UIColor whiteColor] CGColor];
    label.layer.borderWidth = 1.0f;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.tag = 99999;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    //label.center = theAppWindow.center;
    [theAppWindow addSubview:label];
    [label release];
    if (hidden) {
        [UIView animateWithDuration:4.5
                         animations:^{
                             if (label) {
                                 label.alpha = 0.2;
                             }
                         }
                         completion:^(BOOL finish){
                             if (label) {
                                 [label removeFromSuperview];
                             }
                         }];
    }
}

+ (void)createProgressDialog:(UIView *)superView
{
    UIImageView *bg = (UIImageView *) [superView viewWithTag:999999];
    
    if (bg)
    {
        return;
    }
    
    bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, CGRectGetHeight(superView.frame))];
    bg.backgroundColor = [UIColor blackColor];
    bg.tag = 999999;
    bg.alpha = 0.2;
    //    bg.image = [UIImage imageNamed:@"bg_subviews"];
    bg.userInteractionEnabled = YES;
    [superView addSubview:bg];
    [bg release];
    
    
    UIActivityIndicatorView *progressdialog = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    progressdialog.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
    progressdialog.center = bg.center;
    [bg addSubview:progressdialog];
    [progressdialog release];
    
    [progressdialog startAnimating];
}

+ (void)createLandscapeProgressDialog:(UIView *)superView
{
    UIImageView *bg = (UIImageView *) [superView viewWithTag:999999];
    
    if (bg)
    {
        return;
    }
    
    bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(superView.frame), 320)];
    bg.backgroundColor = [UIColor blackColor];
    bg.tag = 999999;
    bg.alpha = 0.2;
    //    bg.image = [UIImage imageNamed:@"bg_subviews"];
    bg.userInteractionEnabled = YES;
    [superView addSubview:bg];
    [bg release];
    
    
    UIActivityIndicatorView *progressdialog = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    progressdialog.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
    progressdialog.center = bg.center;
    [bg addSubview:progressdialog];
    [progressdialog release];
    
    [progressdialog startAnimating];
}


+ (void)closeProgressDialog:(UIView *)superView
{
    UIImageView *bg = (UIImageView *) [superView viewWithTag:999999];
    if (bg)
    {
        [bg removeFromSuperview];
    }
}

+ (NSUInteger)getWeekdayFlagFromString:(NSString *)string
{
    NSDate *date = [self dateFromString:string format:@"yyyy-MM-dd"];
    
    NSUInteger flag = [self getWeekdayFromDate:date];
    
    return flag;
}

+ (NSString *)getStringFromFlag:(int)flag
{
    NSString *weekday = @"";
    switch (flag) {
        case 1:
            weekday = @"星期日";
            break;
        case 2:
            weekday = @"星期一";
            break;
        case 3:
            weekday = @"星期二";
            break;
        case 4:
            weekday = @"星期三";
            break;
        case 5:
            weekday = @"星期四";
            break;
        case 6:
            weekday = @"星期五";
            break;
        case 0:
            weekday = @"星期六";
            break;
            
        default:
            break;
    }
    return weekday;
}

+(NSString *)getWeekdayFromString:(NSString *)string
{
    NSDate *date = [self dateFromString:string format:@"yyyy-MM-dd"];
    
    NSUInteger flag = [self getWeekdayFromDate:date];
    
    NSString *weekday = @"";
    switch (flag) {
        case 1:
            weekday = @"周日";
            break;
        case 2:
            weekday = @"周一";
            break;
        case 3:
            weekday = @"周二";
            break;
        case 4:
            weekday = @"周三";
            break;
        case 5:
            weekday = @"周四";
            break;
        case 6:
            weekday = @"周五";
            break;
        case 0:
            weekday = @"周六";
            break;
            
        default:
            break;
    }
    return weekday;
}


+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *df=[[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:format];
    NSDate *fromdate=[df dateFromString:string];
    
    return fromdate;
}

+ (NSUInteger)getWeekdayFromDate:(NSDate *)date
{
    NSCalendar* calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSInteger unitFlags = NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit;
    
    NSDateComponents* components = [calendar components:unitFlags fromDate:date];
    NSUInteger weekday = [components weekday];
    
    return weekday;
}


+ (NSString *)getStringFromDate:(NSDate *)date
{
    NSDateFormatter *df=[[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [df stringFromDate:date];
    
    return dateString;
}

+ (NSDate *)getDateFromString:(NSString *)string
{
    NSDateFormatter *df=[[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [df dateFromString:string];
    
    return date;
}


+ (void)loadAppGuideViewAtFirstTimeWithDelegate:(id)delegate
{
//    NSArray *names = nil;
//    
//    if ([self isIphone5]) {
//        names =  @[@"app_guide_1136_1",@"app_guide_1136_2",@"app_guide_1136_3",@"app_guide_1136_4",@"app_guide_1136_5"];
//    }
//    else
//    {
//        names = @[@"app_guide_1",@"app_guide_2",@"app_guide_3",@"app_guide_4",@"app_guide_5"];
//    }
//    
//    ShowBigImageView *guideView = [[ShowBigImageView alloc] initWithArray:names];
//    guideView.delegate = delegate;
//    [[AppDelegate shareAppDelegate].window addSubview:guideView];
//    [guideView release];
}

+ (NSString *)getCachePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    
    return path;
}



@end
