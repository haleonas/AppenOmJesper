//
//  ViewController.m
//  TableView2
//
//  Created by Jesper Stenlund on 2020-01-14.
//  Copyright © 2020 Jesper Stenlund. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property NSUserDefaults *settings;
@end

@implementation ViewController

NSString *bgKey = @"BG";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.settings = [NSUserDefaults standardUserDefaults];
    NSString *background = [_settings objectForKey:bgKey];
    NSLog(@"%@", background);
    
    if([background isEqualToString:@"White"])
    {
        self.view.backgroundColor = [UIColor whiteColor];
        //sätt till "mörkt" tema
    }
    else
    {
        //sätt till mörte tema
        self.view.backgroundColor = [UIColor grayColor];
    }
    
}


@end
