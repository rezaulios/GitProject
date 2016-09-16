//
//  ViewController.m
//  GitProject
//
//  Created by MDREZAUL KARIM on 9/15/16.
//  Copyright © 2016 Karim. All rights reserved.
//

#import "ViewController.h"
#import "SearchTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    SearchTableViewController* svc = segue.destinationViewController;
    svc.username = self.myTextField.text;
    
    
}



@end
