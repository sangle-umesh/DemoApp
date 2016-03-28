//
//  ViewController.m
//  Label_demo
//
//  Created by Umesh Sangle on 23/03/16.
//  Copyright © 2016 Umesh Sangle. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AVFoundation/AVFoundation.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.frame = CGRectMake(0, 0, self.view.frame.size.width, 180.0f); // set frame as your need
   datePicker.datePickerMode = UIDatePickerModeTime;
       [self.view addSubview:datePicker];
    
    UILabel  * label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 300, 50)];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:datePicker.date];
    label1.text = currentTime;
    [self.view addSubview:label1];
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    
    
     pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(20, 500, 300, 40);
    pageControl.numberOfPages = 9;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    
    self.img1.hidden=YES;
    self.img2.hidden=YES;
    self.img3.hidden=YES;
    self.img4.hidden=YES;
    self.img5.hidden=YES;
    self.img6.hidden=YES;
    self.img7.hidden=YES;
    self.img8.hidden=YES;
    self.img9.hidden=YES;
    
//    NSString* saveFileName = @"bf20d53bdb3d1a42f6f9e069177fab90.mp4";
//  //  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
// //   NSString *documentsDirectory = [paths objectAtIndex:0];
////    NSString *path = [documentsDirectory stringByAppendingPathComponent:saveFileName];
////    // Do any additional setup after loading the view, typically from a nib.
//// 
////    
////    // - - -
////    
////    NSURL *url = [[NSURL alloc] initFileURLWithPath: path];
////
////   // [self setupAVPlayerForURL:url];
//    
//   
//    NSString*thePath=[[NSBundle mainBundle] pathForResource:@"bf20d53bdb3d1a42f6f9e069177fab90" ofType:@"mp4"];
//    NSURL*theurl=[NSURL fileURLWithPath:thePath];
//    AVPlayer *player = [AVPlayer playerWithURL:theurl];
//    
//    AVPlayerLayer *layer = [AVPlayerLayer layer];
//    
//    [layer setPlayer:player];
//    [layer setFrame:CGRectMake(0, 20,320,  self.view.frame.size.height)];
//    [layer setBackgroundColor:[UIColor grayColor].CGColor];
//    [layer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
//    
//    [self.view.layer addSublayer:layer];
//
//    [player play];
//
//    
//    
//    

//    
//  //  NSString*thePath=[[NSBundle mainBundle] pathForResource:path ofType:@"mp4"];
//  //  NSURL*theurl=[NSURL fileURLWithPath:thePath];
//
//    NSURL *vedioURL;
//  
//    
//    NSArray *filePathsArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:documentsDirectory  error:nil];
//    NSLog(@"files array %@", filePathsArray);
//    
//    NSString *fullpath;
//    
//    for ( NSString *apath in filePathsArray )
//    {
//        fullpath = [documentsDirectory stringByAppendingPathComponent:apath];
//        vedioURL =[NSURL fileURLWithPath:path];
//    }
//    NSLog(@"vurl %@",vedioURL);
//    MPMoviePlayerViewController *videoPlayerView = [[MPMoviePlayerViewController alloc] initWithContentURL:vedioURL];
//    [self presentMoviePlayerViewControllerAnimated:videoPlayerView];
//    [videoPlayerView.moviePlayer play];
//    
//    
// la = [[UILabel alloc]initWithFrame:CGRectMake(320, 100, 200, 60)];
//    
//    la.text = @"This is my music line";
//    
//    [self.view addSubview:la];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(LabelAnimation)
                                   userInfo:nil
                                    repeats:YES];
    
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRight.numberOfTouchesRequired = 1;
    
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    swipeleft.numberOfTouchesRequired = 1;
    
    [self.myLabel.superview addGestureRecognizer:swipeleft];
    [self.myLabel.superview addGestureRecognizer:swipeRight];
    self.myLabel.userInteractionEnabled = true;
    
    nameArr = [NSArray arrayWithObjects: @"Jill Valentine i am one", @"Peter Griffin i am Two", @"Meg Griffin i am Three", @"Jack Lolwut i am four",
               @"Mike Roflcoptor i am Five", @"Cindy Woods i am Six", @"Jessica Windmill i am Seven", @"Alexander The Great i am Eight",
               @"Sarah Peterson i am Nine",
               nil];
    // NSUInteger randomIndex = arc4random() % [nameArr count];
    
    i=0;
    name = [nameArr objectAtIndex: i];
    self.myLabel.text=name;
    NSLog(@"%d", i);
}
- (void)dateChanged:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
//    NSString *currentTime = [dateFormatter stringFromDate:datePicker.date];
//    NSLog(@"%@", currentTime);
}
-(void)LabelAnimation
{
//    [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
//        la.frame = CGRectMake(-320, 100, 200, 60);
//    } completion:^(BOOL finished)
//     {
//         la.frame = CGRectMake(320, 100, 200, 60);
//     }];
//    
}
- (void)swipedRight:(UIGestureRecognizer *)recognizer
{
    if(i < 8)
    {
        i++;
        NSLog(@"I swiped  swipedRight;)");
        pageControl.currentPage +=1;
        name = [nameArr objectAtIndex: i];
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationOptionTransitionNone];
//        [UIView setAnimationDuration:2.0f];
//        self.myLabel.userInteractionEnabled = false;
////        [self.myLabel setAlpha:0];
//        [self.myLabel setText:name];
////        [self.myLabel setAlpha:1];
//        [UIView commitAnimations];
        self.myLabel.userInteractionEnabled = false;
        [UIView animateWithDuration:0.8f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
            self.myLabel.frame = CGRectMake(-320, self.myLabel.frame.origin.y, 320, 80);
            [self.myLabel setText:name];
            self.myLabel.frame = CGRectMake(320, self.myLabel.frame.origin.y, 320, 80);
        } completion:^(BOOL finished)
         {
//              [self.myLabel setText:name];
//            self.myLabel.frame = CGRectMake(320, self.myLabel.frame.origin.y, 320, 80);
         }];
        
//        [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
//            la.frame = CGRectMake(-320, 100, 200, 60);
//        } completion:^(BOOL finished)
//         { [la setText:name];
//             la.frame = CGRectMake(320, 100, 200, 60);
//         }];
        
    }
    else
    {
        
    }
//    [self.img1 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img2 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img3 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img4 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img5 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img6 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img7 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img8 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img9 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    if (i==0) {
//        
//        [self.img1 setImage:[UIImage imageNamed:@"black-dot.png"]];
//        
//    }
//    
//    if (i==1) {
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:0.5f];
////        [self.img2 setAlpha:0];
//        [self.img2 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img2 setAlpha:1];
//        [UIView commitAnimations];
//        
//    }
//    if (i==2) {
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:0.5f];
////        [self.img3 setAlpha:0];
//        [self.img3 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img3 setAlpha:1];
//        [UIView commitAnimations];
//    }
//    if (i==3) {
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:0.5f];
////        [self.img4 setAlpha:0];
//        [self.img4 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img4 setAlpha:1];
//        [UIView commitAnimations];
//        
//    }
//    if (i==4) {
//        
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:1.0f];
////        [self.img5 setAlpha:0];
//        [self.img5 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img5 setAlpha:1];
//        [UIView commitAnimations];
//    }
//    if (i==5) {
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:1.0f];
////        [self.img6 setAlpha:0];
//        [self.img6 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img6 setAlpha:1];
//        [UIView commitAnimations];
//    }
//    if (i==6) {
//        
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:1.0f];
////        [self.img7 setAlpha:0];
//        [self.img7 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img7 setAlpha:1];
//        [UIView commitAnimations];
//    }
//    if (i==7) {
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:1.0f];
////        [self.img8 setAlpha:0];
//        [self.img8 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img8 setAlpha:1];
//        [UIView commitAnimations];
//    }
//    if (i==8) {
//        
//        [UIView beginAnimations:@"animateText" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:1.0f];
//        [self.img9 setAlpha:0];
//        [self.img9 setImage:[UIImage imageNamed:@"black-dot.png"]];
//        [self.img9 setAlpha:1];
//        [UIView commitAnimations];
//    }
//  
    self.myLabel.userInteractionEnabled = true;
}

- (void)swipeleft:(UIGestureRecognizer *)recognizer
{
    if(i == 0)
{
    name = [nameArr objectAtIndex: i];
    self.myLabel.text=name;
}
else{
    i--;
    NSLog(@"I swiped swipeleft ;)");
    
    NSLog(@"I swiped  swipedRight;)");
    name = [nameArr objectAtIndex: i];
     pageControl.currentPage -=1;
//    self.myLabel.text=name;
    
//    [UIView beginAnimations:@"animateText" context:nil];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//    [UIView setAnimationDuration:1.0f];
//    [self.myLabel setAlpha:0];
//    [self.myLabel setText:name];
//     [self.myLabel setAlpha:1];
//     [UIView commitAnimations];
    
    
//    [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
//        la.frame = CGRectMake(320, 100, 200, 60);
//       
//    } completion:^(BOOL finished)
//     { [la setText:name];
//         la.frame = CGRectMake(-320, 100, 200, 60);
//     }];
//    name = [nameArr objectAtIndex: i];
//    self.myLabel.text=name;
    
    self.myLabel.userInteractionEnabled = false;
    [UIView animateWithDuration:0.8f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
        self.myLabel.frame = CGRectMake(320, self.myLabel.frame.origin.y, 320, 80);
        [self.myLabel setText:name];
        self.myLabel.frame = CGRectMake(-320, self.myLabel.frame.origin.y, 320, 80);
    } completion:^(BOOL finished)
     {
         //              [self.myLabel setText:name];
         //            self.myLabel.frame = CGRectMake(320, self.myLabel.frame.origin.y, 320, 80);
     }];
}
    
// 
//    [self.img1 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img2 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img3 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img4 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img5 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img6 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img7 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img8 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    [self.img9 setImage:[UIImage imageNamed:@"gray_dot.png"]];
//    if (i==0) {
//        
//        [self.img1 setImage:[UIImage imageNamed:@"black-dot.png"]];
//        
//    }
//    
//    if (i==1) {
////        [UIView beginAnimations:@"animateText" context:nil];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
////        [UIView setAnimationDuration:1.0f];
////        [self.img2 setAlpha:0];
//        [self.img2 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img2 setAlpha:1];
////        [UIView commitAnimations];
//        
//    }
//    if (i==2) {
////        [UIView beginAnimations:@"animateText" context:nil];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
////        [UIView setAnimationDuration:1.0f];
////        [self.img3 setAlpha:0];
//        [self.img3 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img3 setAlpha:1];
////        [UIView commitAnimations];
//    }
//    if (i==3) {
////        [UIView beginAnimations:@"animateText" context:nil];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
////        [UIView setAnimationDuration:1.0f];
////        [self.img4 setAlpha:0];
//        [self.img4 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img4 setAlpha:1];
////        [UIView commitAnimations];
//        
//    }
//    if (i==4) {
//        
////        [UIView beginAnimations:@"animateText" context:nil];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
////        [UIView setAnimationDuration:1.0f];
////        [self.img5 setAlpha:0];
//        [self.img5 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img5 setAlpha:1];
////        [UIView commitAnimations];
//    }
//    if (i==5) {
////        [UIView beginAnimations:@"animateText" context:nil];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
////        [UIView setAnimationDuration:1.0f];
////        [self.img6 setAlpha:0];
//        [self.img6 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img6 setAlpha:1];
////        [UIView commitAnimations];
//    }
//    if (i==6) {
//        
////        [UIView beginAnimations:@"animateText" context:nil];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
////        [UIView setAnimationDuration:1.0f];
////        [self.img7 setAlpha:0];
//        [self.img7 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img7 setAlpha:1];
////        [UIView commitAnimations];
//    }
//    if (i==7) {
////        [UIView beginAnimations:@"animateText" context:nil];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
////        [UIView setAnimationDuration:1.0f];
////        [self.img8 setAlpha:0];
//        [self.img8 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img8 setAlpha:1];
////        [UIView commitAnimations];
//    }
//    if (i==8) {
//        
////        [UIView beginAnimations:@"animateText" context:nil];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
////        [UIView setAnimationDuration:1.0f];
////        [self.img9 setAlpha:0];
//        [self.img9 setImage:[UIImage imageNamed:@"black-dot.png"]];
////        [self.img9 setAlpha:1];
////        [UIView commitAnimations];
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
