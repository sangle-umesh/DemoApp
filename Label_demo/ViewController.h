//
//  ViewController.h
//  Label_demo
//
//  Created by Umesh Sangle on 23/03/16.
//  Copyright © 2016 Umesh Sangle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate>
{
    UICollectionView *_collectionView;
    NSString* name;
    NSArray* nameArr;
    int i;
    UILabel *  la;
    UIPageControl * pageControl;
//    AVPlayer *player;
//    AVPlayerLayer * playerLayer;
//    AVAsset *asset;
//    AVPlayerItem  *playerItem;
}



@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (weak, nonatomic) IBOutlet UIImageView *img9;
@property (weak, nonatomic) IBOutlet UIImageView *img8;
@property (weak, nonatomic) IBOutlet UIImageView *img7;
@property (weak, nonatomic) IBOutlet UIImageView *img6;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img1;

//@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

