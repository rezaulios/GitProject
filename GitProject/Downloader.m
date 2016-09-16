//
//  Downloader.m
//  PokemonAPp
//
//  Created by Rakin Munjid on 7/19/16.
//  Copyright © 2016 Rakin Munjid. All rights reserved.
//

#import "Downloader.h"

@implementation Downloader

-(void) downloadDataForUrl:(NSString *)theUrl {
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:theUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(!error){
            NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
            if(resp.statusCode == 200){
                if(data){
                    NSError *errorData;
                    NSArray * jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorData];
                    if(!errorData){
                        if([self.delegate respondsToSelector:@selector(didDownloadData:)]){
                            [self.delegate didDownloadData:jsonArray];
                        }
                    } else {
                        if([self.delegate respondsToSelector:@selector(didFailWithError:)]){
                            [self.delegate didFailWithError:@"Error in JSON"];
                        }
                    }
                } else {
                    if([self.delegate respondsToSelector:@selector(didFailWithError:)]){
                        [self.delegate didFailWithError:@"Data not returned"];
                    }
                }
            } else {
                if([self.delegate respondsToSelector:@selector(didFailWithError:)]){
                    [self.delegate didFailWithError:@"Response Error"];
                }
            }
        } else {
            if([self.delegate respondsToSelector:@selector(didFailWithError:)]){
                [self.delegate didFailWithError:@"Error Fetching Data"];
            }
        }
        
        
    }] resume];
    
    
}

@end
