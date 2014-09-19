//
//  ViewController.m
//  TicTacToe
//
//  Created by Alex Hudson on 9/18/14.
//  Copyright (c) 2014 Alex Hudson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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

@property BOOL isItXsTurn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isItXsTurn = YES;
    self.whichPlayerLabel.text = @"X's Turn";
}

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
            }
            self.isItXsTurn = YES;
            self.whichPlayerLabel.text = @"X's Turn";
        }
    }
}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self resetButtons];

}
- (IBAction)onRestartButtonPressed:(id)sender {

    [self resetButtons];
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
@end
