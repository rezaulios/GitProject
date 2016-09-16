//
//  SearchTableViewController.m
//  GitProject
//
//  Created by MDREZAUL KARIM on 9/15/16.
//  Copyright © 2016 Karim. All rights reserved.
//

#import "SearchTableViewController.h"
#import "Downloader.h"

@interface SearchTableViewController () <DownloaderDelegate>{
    NSArray * jsonArray ;
    NSString * strName;
    NSMutableArray * nameArray;
}

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.username;
    
    NSString * strurl = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos",self.username];
    
    NSLog(@"%@",strurl);
    
    Downloader *downloader = [[Downloader alloc] init];
    
    downloader.delegate = self;
    [downloader downloadDataForUrl:strurl];
    
}

-(void)didDownloadData:(NSArray *) theObject{
    
            
    nameArray = [[NSMutableArray alloc]init];
    for (NSDictionary* eachDict in theObject) {
        strName = [eachDict objectForKey:@"name"];
        [nameArray addObject:strName];
            }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        
        
    });
    
}
-(void)didFailWithError:(NSString *) errorString{
    NSLog(@"%@",errorString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return nameArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [nameArray objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
