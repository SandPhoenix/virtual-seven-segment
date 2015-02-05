//
//  ViewController.m
//  7Digit
//
//  Created by Matteo Sandrin on 05/02/15.
//  Copyright (c) 2015 Matteo Sandrin. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.window setFrame:NSRectFromCGRect(CGRectMake(300, 300, 1442, 320)) display:true];
    self.view.frame = NSRectFromCGRect(CGRectMake(0, 0, 1442, 320));
    [self.view setNeedsDisplay:true];
    [self.view setWantsLayer:YES];
    self.view.layer.backgroundColor = [NSColor colorWithRed:0 green:0 blue:0 alpha:1].CGColor;
    
    array = [NSMutableArray array];
    images = [NSMutableArray array];
    status = @"000000";
    
    for (int i = 0; i < 10; i++) {
        [images addObject:[NSImage imageNamed:[NSString stringWithFormat:@"segment-0%d.png",i]]];
    }
    
    for (int i = 0; i < 6; i++) {
        int k = 0;
//        if (i == 2 || i == 4){
//            k = 145;
//        }
        NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSRectFromCGRect(CGRectMake(i*192+k, 0, 192, 320))];
        imageView.image = images[0];
        [self.view addSubview:imageView];
        [array addObject:imageView];
        
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setTime) userInfo:nil repeats:true];

    // Do any additional setup after loading the view.
}





-(void) setTime{
    NSString *new = [self current];
    for (int i = 0; i < 6; i++) {
        char n = [new characterAtIndex:i];
        char o = [status characterAtIndex:i];
        if (o != n) {
            NSImage *image = images[ [[new substringWithRange:NSMakeRange(i, 1)] integerValue] ];
            NSImageView *view = array[i];
            view.image = image;
        }
    }
    status = new;
}

-(NSString*) current{
    
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HHmmss"];
    NSString *cur = [outputFormatter stringFromDate:now];
    return cur;

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
