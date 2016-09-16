//
//  Downloader.h
//  PokemonAPp
//
//  Created by Rakin Munjid on 7/19/16.
//  Copyright © 2016 Rakin Munjid. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownloaderDelegate <NSObject>

-(void)didDownloadData:(NSArray *) theObject;
-(void)didFailWithError:(NSString *) errorString;

@end

@interface Downloader : NSObject

-(void) downloadDataForUrl:(NSString *)theUrl;

@property (nonatomic, weak) id<DownloaderDelegate> delegate;

@end
