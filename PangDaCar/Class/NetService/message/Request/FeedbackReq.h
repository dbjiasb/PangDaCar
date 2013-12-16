//
//  Feedback.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface FeedbackReq: RequestMsg

@property (nonatomic, copy) NSString *feedback_content;

@end
