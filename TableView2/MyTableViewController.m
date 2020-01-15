//
//  MyTableViewController.m
//  TableView2
//
//  Created by Jesper Stenlund on 2020-01-14.
//  Copyright © 2020 Jesper Stenlund. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
@property NSString *currentBG;


@end

@implementation MyTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
      
    self.letters = @[@"About me",@"Interests",@"Why It-högskolan",@"Game",@"Background"];
    
    self.currentBG = @"White";
    [self saveSettings];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.letters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *simpleIdentifier = @"simple identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier];
   
    // Configure the cell...
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleIdentifier];
    }
    
    cell.textLabel.text = self.letters[indexPath.row];
    if(indexPath.row ==  [_letters count] - 1)
    {
        UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 9, 50, 50)];
        [mySwitch addTarget: self action: @selector(changeBg) forControlEvents:UIControlEventValueChanged];
        [cell.contentView addSubview:mySwitch];
        [[UISwitch appearance] setOnTintColor:[UIColor colorWithRed:163.0/255.0 green:12.0/255.0 blue:17.0/255.0 alpha:1.0]];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

-(void) changeBg
{
    if([self.currentBG isEqualToString:@"White"])
    {
        //sätt till "mörkt" tema
        self.view.backgroundColor = [UIColor grayColor];
        self.currentBG = @"Black";
    }
    else
    {
        //sätt till ljust tema
        self.view.backgroundColor = [UIColor whiteColor];
        self.currentBG = @"White";
    }
    
    [self saveSettings];
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowValue = self.letters[indexPath.row];
    
    if([rowValue isEqualToString:@"About me"])
    {
        [self performSegueWithIdentifier:@"AboutMe" sender:self];
    }
    else if([rowValue isEqualToString:@"Interests"])
    {
        [self performSegueWithIdentifier:@"Interests" sender:self];
    }
    else if([rowValue isEqualToString:@"Why It-högskolan"])
    {
        [self performSegueWithIdentifier:@"WhyItHogSkolan" sender:self];
    }
    else if([rowValue isEqualToString:@"Game"])
    {
         [self performSegueWithIdentifier:@"Game" sender:self];
    }
}

-(void) saveSettings
{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];

    NSString *bgKey = @"BG";
    
    [settings setObject:self.currentBG forKey:bgKey];
    [settings synchronize];
}

@end
