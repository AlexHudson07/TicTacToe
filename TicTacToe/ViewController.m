//
//  ViewController.m
//  TicTacToe
//
//  Created by Alex Hudson on 9/18/14.
//  Copyright (c) 2014 Alex Hudson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *labelOne;
@property (strong, nonatomic) IBOutlet UILabel *labelTwo;
@property (strong, nonatomic) IBOutlet UILabel *labelThree;
@property (strong, nonatomic) IBOutlet UILabel *labelFour;
@property (strong, nonatomic) IBOutlet UILabel *labelFive;
@property (strong, nonatomic) IBOutlet UILabel *labelSix;
@property (strong, nonatomic) IBOutlet UILabel *labelSeven;
@property (strong, nonatomic) IBOutlet UILabel *labelEight;
@property (strong, nonatomic) IBOutlet UILabel *labelNine;
@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (strong, nonatomic) IBOutlet UILabel *oLabel;
@property (strong, nonatomic) IBOutlet UILabel *xLabel;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureRecognizer;
@property (strong, nonatomic) NSTimer * t;
@property UIAlertView * timerAlertView;
@property UIAlertView * whoWonAlertView;
@property UIAlertView * startAlertView;
@property NSRunLoop * runLoop;

@property BOOL isItXsTurn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isItXsTurn = YES;
    self.whichPlayerLabel.text = @"X's Turn";
    self.startAlertView = [[UIAlertView alloc]init];
    self.startAlertView.delegate = self;
    self.startAlertView.backgroundColor = [UIColor greenColor];
    self.startAlertView.title = @"Each Player will have 10 seconds to make a move";
    [self.startAlertView addButtonWithTitle:@"OK"];
    [self.startAlertView show];

}

-(void) timerExpried{

    NSLog (@"Timer Expired");

    self.timerAlertView = [[UIAlertView alloc]init];
    self.timerAlertView.delegate = self;
    self.timerAlertView.title = @"You took to long, you lost your turn";
    [self.timerAlertView addButtonWithTitle:@"OK"];
    [self.timerAlertView show];
    self.isItXsTurn = !self.isItXsTurn;

    if (self.isItXsTurn) {
        self.whichPlayerLabel.text = @"X's Turn";
    }else{
        self.whichPlayerLabel.text = @"O's Turn";
    }

}

-(void)setTimer
{
    [self.t invalidate];
    self.t = nil;

    self.t = [NSTimer scheduledTimerWithTimeInterval: 10.0
                                              target: self
                                            selector:@selector(timerExpried)
                                            userInfo: nil repeats:NO];

    self.runLoop = [NSRunLoop currentRunLoop];
    [self.runLoop addTimer: self.t forMode: NSDefaultRunLoopMode];

    NSLog(@"Timer Reset");

}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{

    if (alertView == self.startAlertView) {
        [self setTimer];
        NSLog(@"Initail timer set");
    }

    if (alertView == self.whoWonAlertView) {
        [self resetButtons];
        [self setTimer];
    }

    if (alertView == self.timerAlertView ) {
        [self setTimer];
        NSLog(@"You have 10 seconds");
    }

}
- (IBAction)onRestartButtonPressed:(id)sender {

    [self.t invalidate];
    self.t = nil;

    [self resetButtons];

    self.startAlertView = [[UIAlertView alloc]init];
    self.startAlertView.delegate = self;
    self.startAlertView.title = @"Remember you only have 10 seconds";
    [self.startAlertView addButtonWithTitle:@"OK"];
    [self.startAlertView show];



}

-(void) resetButtons{

    self.labelOne.text = @"";
    self.labelTwo.text = @"";
    self.labelThree.text = @"";
    self.labelFour.text = @"";
    self.labelFive.text = @"";
    self.labelSix.text =  @"";
    self.labelSeven.text = @"";
    self.labelEight.text = @"";
    self.labelNine.text = @"";
}

-(UILabel *) findLabelUsingPoint:(CGPoint)point{

    if (CGRectContainsPoint(self.labelOne.frame, point)) {

        return self.labelOne;
    }

    if (CGRectContainsPoint(self.labelTwo.frame, point)) {

        return self.labelTwo;
    }

    if (CGRectContainsPoint(self.labelThree.frame, point)) {

        return self.labelThree;
    }
    if (CGRectContainsPoint(self.labelFour.frame, point)) {

        return self.labelFour;
    }

    if (CGRectContainsPoint(self.labelFive.frame, point)) {

        return self.labelFive;
    }

    if (CGRectContainsPoint(self.labelSix.frame, point)) {

        return self.labelSix;
    }
    if (CGRectContainsPoint(self.labelSeven.frame, point)) {

        return self.labelSeven;
    }

    if (CGRectContainsPoint(self.labelEight.frame, point)) {

        return self.labelEight;
    }

    if (CGRectContainsPoint(self.labelNine.frame, point)) {
       
        return self.labelNine;
    }

    return nil;
}

-(NSString *) whoWon{

    if ([self.labelOne.text isEqualToString:@"X"] && [self.labelTwo.text isEqualToString:@"X"] && [self.labelThree.text isEqualToString:@"X"]) {
        return @"X Won";
    }

    if ([self.labelFour.text isEqualToString:@"X"] && [self.labelFive.text isEqualToString:@"X"] && [self.labelSix.text isEqualToString:@"X"]) {
        return @"X Won";
    }

    if ([self.labelSeven.text isEqualToString:@"X"] && [self.labelEight.text isEqualToString:@"X"] && [self.labelNine.text isEqualToString:@"X"]) {
        return @"X Won";
    }

    if ([self.labelOne.text isEqualToString:@"X"] && [self.labelFour.text isEqualToString:@"X"] && [self.labelSeven.text isEqualToString:@"X"]) {
        return @"X Won";
    }

    if ([self.labelTwo.text isEqualToString:@"X"] && [self.labelFive.text isEqualToString:@"X"] && [self.labelEight.text isEqualToString:@"X"]) {
        return @"X Won";
    }

    if ([self.labelThree.text isEqualToString:@"X"] && [self.labelSix.text isEqualToString:@"X"] && [self.labelNine.text isEqualToString:@"X"]) {
        return @"X Won";
    }

    if ([self.labelOne.text isEqualToString:@"X"] && [self.labelFive.text isEqualToString:@"X"] && [self.labelNine.text isEqualToString:@"X"]) {
        return @"X Won";
    }

    if ([self.labelThree.text isEqualToString:@"X"] && [self.labelFive.text isEqualToString:@"X"] && [self.labelSeven.text isEqualToString:@"X"]) {
        return @"X Won";
    }

    //Checking for O's win conditions------------------------------

    if ([self.labelOne.text isEqualToString:@"O"] && [self.labelTwo.text isEqualToString:@"O"] && [self.labelThree.text isEqualToString:@"O"]) {
        return @"O Won";
    }

    if ([self.labelFour.text isEqualToString:@"O"] && [self.labelFive.text isEqualToString:@"O"] && [self.labelSix.text isEqualToString:@"O"]) {
        return @"O Won";
    }

    if ([self.labelSeven.text isEqualToString:@"O"] && [self.labelEight.text isEqualToString:@"O"] && [self.labelNine.text isEqualToString:@"O"]) {
        return @"O Won";
    }

    if ([self.labelOne.text isEqualToString:@"O"] && [self.labelFour.text isEqualToString:@"O"] && [self.labelSeven.text isEqualToString:@"O"]) {
        return @"O Won";
    }

    if ([self.labelTwo.text isEqualToString:@"O"] && [self.labelFive.text isEqualToString:@"O"] && [self.labelEight.text isEqualToString:@"O"]) {
        return @"O Won";
    }

    if ([self.labelThree.text isEqualToString:@"O"] && [self.labelSix.text isEqualToString:@"O"] && [self.labelNine.text isEqualToString:@"O"]) {
        return @"O Won";
    }

    if ([self.labelOne.text isEqualToString:@"O"] && [self.labelFive.text isEqualToString:@"O"] && [self.labelNine.text isEqualToString:@"O"]) {
        return @"O Won";
    }

    if ([self.labelThree.text isEqualToString:@"O"] && [self.labelFive.text isEqualToString:@"O"] && [self.labelSeven.text isEqualToString:@"O"]) {
        return @"O Won";
    }

    if (![self.labelOne.text isEqual: @""] &&
        ![self.labelTwo.text isEqual: @""] &&
        ![self.labelThree.text isEqual: @""] &&
        ![self.labelFour.text isEqual: @""] &&
        ![self.labelFive.text isEqual: @""] &&
        ![self.labelSix.text isEqual: @""] &&
        ![self.labelSeven.text isEqual: @""] &&
        ![self.labelEight.text isEqual: @""] &&
        ![self.labelNine.text isEqual: @""]) {

        UIAlertView *alertView = [[UIAlertView alloc]init];
        alertView.delegate = self;
        alertView.title = @"Cats Game";
        [alertView addButtonWithTitle:@"Restart"];
        [alertView show];
    }

    return nil;
}
#pragma mark - Tap Gesture Recognizer methods

- (IBAction)onLabelTapped:(UITapGestureRecognizer *) tapGestureRecognizer{

    CGPoint touchedPoint = [tapGestureRecognizer locationInView:self.view];
    NSLog(@"%f and %f", touchedPoint.x, touchedPoint.y);

    if ([[self findLabelUsingPoint:touchedPoint].text isEqualToString:@""]) {

        if (self.isItXsTurn) {
            [self findLabelUsingPoint:touchedPoint].text = @"X";
            [self findLabelUsingPoint:touchedPoint].textColor = [UIColor blueColor];

            if ([self whoWon]) {

                UIAlertView *alertView = [[UIAlertView alloc]init];
                alertView.delegate = self;
                alertView.title = [self whoWon];
                [alertView addButtonWithTitle:@"Restart"];
                [alertView show];
                [self.t invalidate];
                self.t = nil;
                // self.runLoop = nil;

                NSLog(@"Timer Stopped");
            } else{

                [self setTimer];
            }

            self.isItXsTurn = NO;
            self.whichPlayerLabel.text = @"O's Turn";

        }else{

            [self findLabelUsingPoint:touchedPoint].text = @"O";
            [self findLabelUsingPoint:touchedPoint].textColor = [UIColor redColor];

            if ([self whoWon]) {

                UIAlertView *alertView = [[UIAlertView alloc]init];
                alertView.delegate = self;
                alertView.title = [self whoWon];
                [alertView addButtonWithTitle:@"Restart"];
                [alertView show];
                [self.t invalidate];
                self.t = nil;
                // self.runLoop = nil;

                NSLog(@"Timer Stopped");
            }
            else{

                [self setTimer];
            }
            self.isItXsTurn = YES;
            self.whichPlayerLabel.text = @"X's Turn";
        }
    }
}


#pragma mark - Pan Gesture Recognizer methods

- (IBAction)onDrag:(UIPanGestureRecognizer *)panGestureRecognizer {

    //getting the delta from where we started to where we are now and sets it to point
    CGPoint point = [panGestureRecognizer translationInView:self.view];

    //NSLog(@"point:x = %f point:y = %f", point.x, point.y);

    if (self.isItXsTurn) {

        //taking delta and making a transform and appliing it to the deltas transfrom
        //transfrom means redrawing not moving the actual frame
        self.xLabel.transform = CGAffineTransformMakeTranslation(point.x, point.y);

        point.x += self.xLabel.center.x;
        point.y += self.xLabel.center.y;

        //NSLog(@"point:x = %f point:y = %f", point.x, point.y);

        if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

            if ([[self findLabelUsingPoint:point].text isEqualToString:@""]) {

                [self findLabelUsingPoint:point].text = @"X";
                [self findLabelUsingPoint:point].textColor = [UIColor blueColor];

                if ([self whoWon]) {

                    self.whoWonAlertView = [[UIAlertView alloc]init];
                    self.whoWonAlertView.delegate = self;
                    self.whoWonAlertView.title = [self whoWon];
                    [self.whoWonAlertView addButtonWithTitle:@"Restart"];
                    [self.whoWonAlertView show];
                    [self.t invalidate];
                    self.t = nil;
                   // self.runLoop = nil;

                    NSLog(@"Timer Stopped");

                }else{

                    [self setTimer];
                }

                self.isItXsTurn = NO;
                self.whichPlayerLabel.text = @"O's Turn";
            }

            [UIView animateWithDuration:1.0f delay:0.0f options:0 animations:^{

                self.xLabel.transform = CGAffineTransformIdentity;
            }completion:nil];

        }
    } else{

        //taking delta and making a transform and appliing it to the deltas transfrom
        //transfrom means redrawing not moving the actual frame
        self.oLabel.transform = CGAffineTransformMakeTranslation(point.x, point.y);


        point.x += self.oLabel.center.x;
        point.y += self.oLabel.center.y;

        //NSLog(@"point:x = %f point:y = %f", point.x, point.y);

         if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

             if ([[self findLabelUsingPoint:point].text isEqualToString:@""]) {

                 [self findLabelUsingPoint:point].text = @"O";
                 [self findLabelUsingPoint:point].textColor = [UIColor redColor];

                 if ([self whoWon]) {
                     self.whoWonAlertView = [[UIAlertView alloc]init];
                     self.whoWonAlertView.delegate = self;
                     self.whoWonAlertView.title = [self whoWon];
                     [self.whoWonAlertView addButtonWithTitle:@"Restart"];
                     [self.whoWonAlertView show];
                     [self.t invalidate];
                     self.t = nil;
                     // self.runLoop = nil;

                     NSLog(@"Timer Stopped");
                 }else{

                     [self setTimer];
                 }

                 self.isItXsTurn = YES;
                 self.whichPlayerLabel.text = @"X's Turn";

             }

             [UIView animateWithDuration:1.0f delay:0.0f options:0 animations:^{

                 self.oLabel.transform = CGAffineTransformIdentity;
             }completion:nil];
         }
    }

    //NSLog (@"onDrag");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    [self.t invalidate];
    self.t = nil;

}

-(IBAction)unwindWebViewSegue:(UIStoryboardSegue *) segue{
    self.startAlertView = [[UIAlertView alloc]init];
    self.startAlertView.delegate = self;
    self.startAlertView.title = @"Remember, will have 10 seconds to make a move";
    [self.startAlertView addButtonWithTitle:@"OK"];
    [self.startAlertView show];
}


@end
