//
//  GameViewController.m
//  TableView2
//
//  Created by Jesper Stenlund on 2020-01-14.
//  Copyright © 2020 Jesper Stenlund. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *currentGuessNum;
@property (weak, nonatomic) IBOutlet UILabel *rightWronglabel;
@property int numToGuess;


@end

@implementation GameViewController


- (IBAction)guessSliderChanged:(UISlider *)sender {
    int num = (int) sender.value;
    self.currentGuessNum.text = [[NSNumber numberWithInt:num] stringValue];
}
- (IBAction)guessButton:(UIButton *)sender {
    int guess = [self.currentGuessNum.text integerValue];
    
    if(guess == self.numToGuess)
    {
        self.rightWronglabel.text = @"Correct, changing number";
        [self changeGuessNum];
    }
    else if(guess < self.numToGuess)
    {
        self.rightWronglabel.text = @"Too low";
    }
    else if(guess > self.numToGuess)
    {
        self.rightWronglabel.text = @"Too high";
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    NSString *background = [settings objectForKey:@"BG"];
    
    NSLog(@"%@", background);
    [self changeGuessNum];
    
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
-(void) changeGuessNum
{
    self.numToGuess = arc4random_uniform(100) + 1;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
