//
//  ViewController.m
//  Day 1 Quiz App
//
//  Created by Sanzhar Askaruly on 6/9/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UIButton *optionAButton;
@property (strong, nonatomic) IBOutlet UIButton *optionBButton;
@property (strong, nonatomic) IBOutlet UIButton *optionCButton;
@property (strong, nonatomic) IBOutlet UIButton *optionDButton;
@property (strong, nonatomic) NSMutableArray *questions;
//@property (strong, nonatomic) NSMutableArray *options;
//@property (strong, nonatomic) NSMutableArray *answers;
@property (nonatomic) int currentQuestion;
@property (strong, nonatomic) IBOutlet UILabel *counterCorrect;
@property (strong, nonatomic) IBOutlet UILabel *counterIncorrect;
@property (nonatomic) int correct;
@property (nonatomic) int incorrect;
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong) NSTimer *timer;
@property (nonatomic) int consumed;
@property (nonatomic) BOOL finished;
@end

@implementation ViewController
- (IBAction)nextQuestionButtonPressed:(id)sender {
    self.currentQuestion += 1;
    self.currentQuestion %= [self.questions count];
    [self showCurrentQuestion];
    [self makeClickable];
}
- (IBAction)showAnswerButtonPressed:(id)sender {
    [self resetButtons];
    [self highlightCorrect];
}
- (IBAction)optionAButtonPressed:(UIButton *)sender {
    [self.optionAButton setBackgroundColor:[UIColor redColor]];
    [self highlightCorrect];
    [self makeUnClickable];
    [self checkCorrect:sender.titleLabel.text];
}
- (IBAction)optionBButtonPressed:(UIButton *)sender {
    [self.optionBButton setBackgroundColor:[UIColor redColor]];
    [self highlightCorrect];
    [self makeUnClickable];
    [self checkCorrect:sender.titleLabel.text];
}

- (IBAction)optionCButtonPressed:(UIButton *)sender {
    [self.optionCButton setBackgroundColor:[UIColor redColor]];
    [self highlightCorrect];
    [self makeUnClickable];
    [self checkCorrect:sender.titleLabel.text];
}
- (IBAction)optionDButtonPressed:(UIButton *)sender {
    [self.optionDButton setBackgroundColor:[UIColor redColor]];
    [self highlightCorrect];
    [self makeUnClickable];
    [self checkCorrect:sender.titleLabel.text];
}

-(void) generateData
{
    NSString *question0 = @"Which forms of of energy are ultimately derived from solar energy?";
    NSString *option0_0=@"Gasoline";
    NSString *option0_1=@"Biofuels";
    NSString *option0_2=@"Wind";
    NSString *option0_3=@"Coal";
    NSArray *options0 = @[option0_0, option0_1, option0_2, option0_3];
    NSString *answer0 = option0_0;
    Question *temp0 = [Question new];
    temp0.questions = question0;
    temp0.options = [options0 mutableCopy];
    temp0.answers = answer0;
    [self shuffle:temp0.options];
    

    NSString *question1 = @"Which type of energy is expected make up the largest portion of the US energy supply in the year 2035?";
    NSString *option1_0 = @"renewable energy";
    NSString *option1_1 = @"liquid biofuels";
    NSString *option1_2 = @"coal";
    NSString *option1_3 = @"oil and other liquid fuels";
    NSArray *options1 = @[option1_0, option1_1, option1_2, option1_3];
    NSString *answer1 = option1_3;
    Question *temp1 = [Question new];
    temp1.questions = question1;
    temp1.options = [options1 mutableCopy];
    temp1.answers = answer1;
    [self shuffle:temp1.options];
    
    NSString *question2 = @"Which nation uses the most gasoline per person?:";
    NSString *option2_0 = @"United States";
    NSString *option2_1 = @"Canada";
    NSString *option2_2 = @"Saudi Arabia";
    NSString *option2_3 = @"Japan";
    NSArray *options2 = @[option2_0, option2_1, option2_2, option2_3];
    NSString *answer2 = option2_0;
    Question *temp2 = [Question new];
    temp2.questions = question2;
    temp2.options = [options2 mutableCopy];
    temp2.answers = answer2;
    [self shuffle:temp2.options];
    
    NSString *question3 = @"The biggest use of energy in the typical US home is: ";
    NSString *option3_0 = @"Home electronics";
    NSString *option3_1 = @"Water heating";
    NSString *option3_2 = @"Space heating";
    NSString *option3_3 = @"Lighting";
    NSArray *options3 = @[option3_0, option3_1, option3_2, option3_3];
    NSString *answer3 = option3_2;
    Question *temp3 = [Question new];
    temp3.questions = question3;
    temp3.options = [options3 mutableCopy];
    temp3.answers = answer3;
    [self shuffle:temp3.options];
    
    NSString *question4 = @"If every American household replaced 3 incandescent light bulbs with compact fluorescent light bulbs, how would US carbon dioxide emissions change?";
    NSString *option4_0 = @"0.75% increase";
    NSString *option4_1 = @"0.1% decrease";
    NSString *option4_2 = @"1.5% decrease";
    NSString *option4_3 = @"5% decrease";
    NSArray *options4 = @[option4_0, option4_1, option4_2, option4_3];
    NSString *answer4 = option4_2;
    Question *temp4 = [Question new];
    temp4.questions = question4;
    temp4.options = [options4 mutableCopy];
    temp4.answers = answer4;
    [self shuffle:temp4.options];
    
    NSString *question5 = @"Which single technology can provide our society with a seamless transition to cheap, safe and carbon-free energy?";
    NSString *option5_0 = @"Electric cars";
    NSString *option5_1 = @"Concentrating solar power";
    NSString *option5_2 = @"Hydrogen fuel cells";
    NSString *option5_3 = @"None of the above";
    NSArray *options5 = @[option5_0, option5_1, option5_2, option5_3];
    NSString *answer5 = option5_3;
    Question *temp5 = [Question new];
    temp5.questions = question5;
    temp5.options = [options5 mutableCopy];
    temp5.answers = answer5;
    [self shuffle:temp5.options];
    
    NSString *question6 = @"What uses more energy? Six hours of laptop use or making coffee?";
    NSString *option6_0 = @"Laptop uses more energy";
    NSString *option6_1 = @"Coffee uses more energy";
    NSString *option6_2 = @"They are about the same";
    NSString *option6_3 = @"I do not know";
    NSArray *options6 = @[option6_0, option6_1, option6_2, option6_3];
    NSString *answer6 = option6_2;
    Question *temp6 = [Question new];
    temp6.questions = question6;
    temp6.options = [options6 mutableCopy];
    temp6.answers = answer6;
    [self shuffle:temp6.options];
    
    NSString *question7 = @"The biggest use of energy in the typical US home is: ";
    NSString *option7_0 = @"Home electronics";
    NSString *option7_1 = @"Water heating";
    NSString *option7_2 = @"Space heating";
    NSString *option7_3 = @"Lighting";
    NSArray *options7 = @[option7_0, option7_1, option7_2, option7_3];
    NSString *answer7 = option7_2;
    Question *temp7 = [Question new];
    temp7.questions = question7;
    temp7.options = [options7 mutableCopy];
    temp7.answers = answer7;
    [self shuffle:temp7.options];
    
    self.questions = [NSMutableArray arrayWithObjects:temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, nil];
    [self shuffle:self.questions ];
}

- (void)shuffle:(NSMutableArray *) tempArray
{
    
    NSUInteger count = tempArray.count;
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [tempArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self generateData];
    self.currentQuestion = 0;
    [self showCurrentQuestion];
    self.consumed =5;
    self.finished = NO;
    self.timerLabel.text = [NSString stringWithFormat:@"%d",self.consumed];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTick:) userInfo:nil repeats:NO];
    
    
}

-(void) resetButtons
{
    [self.optionAButton setBackgroundColor:[UIColor grayColor]];
    [self.optionBButton setBackgroundColor:[UIColor grayColor]];
    [self.optionCButton setBackgroundColor:[UIColor grayColor]];
    [self.optionDButton setBackgroundColor:[UIColor grayColor]];
}

-(void) showCurrentQuestion
{
    Question *question = self.questions[self.currentQuestion];
    self.questionLabel.text = question.questions;  //self.questions[self.currentQuestion];
    NSArray *currentOptions = question.options;
    
    [self.optionAButton setTitle:currentOptions[0] forState:UIControlStateNormal];
    [self.optionBButton setTitle:currentOptions[1] forState:UIControlStateNormal];
    [self.optionCButton setTitle:currentOptions[2] forState:UIControlStateNormal];
    [self.optionDButton setTitle:currentOptions[3] forState:UIControlStateNormal];
    [self resetButtons];
}

-(void) highlightCorrect
{
    if ([[self.questions[self.currentQuestion] answers] isEqualToString:self.optionAButton.titleLabel.text]) {
        [self.optionAButton setBackgroundColor:[UIColor greenColor]];
    }
    if ([[self.questions[self.currentQuestion] answers] isEqualToString:self.optionBButton.titleLabel.text]) {
        [self.optionBButton setBackgroundColor:[UIColor greenColor]];
    }
    if ([[self.questions[self.currentQuestion] answers] isEqualToString:self.optionCButton.titleLabel.text]) {
        [self.optionCButton setBackgroundColor:[UIColor greenColor]];
    }
    if ([[self.questions[self.currentQuestion] answers] isEqualToString:self.optionDButton.titleLabel.text]) {
        [self.optionDButton setBackgroundColor:[UIColor greenColor]];
    }
}

- (void) makeUnClickable
{
    self.optionAButton.enabled = NO;
    self.optionBButton.enabled = NO;
    self.optionCButton.enabled = NO;
    self.optionDButton.enabled = NO;
}
- (void) updateResult {
    self.counterCorrect.text = [NSString stringWithFormat:@"%d", self.correct];
    self.counterIncorrect.text = [NSString stringWithFormat:@"%d", self.incorrect];
}

- (void) checkCorrect:(NSString *)answer {
    if ([[self.questions[self.currentQuestion] answers] isEqualToString: answer]) { //answers
        self.correct+=1;
    }
    else {
        self.incorrect+=1;
    }
       [self updateResult];
    
    
    if(self.currentQuestion == 7){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congrats" message:[NSString stringWithFormat:@"Your score is: %d", self.correct]delegate: nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retake", nil];
        [alert show];
    }

};


-(void)onTick: (NSTimer *) theTimer{
    
    if(self.finished == YES) return;
    if(self.consumed == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time consumed" message:[NSString stringWithFormat:@"You have scored %d correct answers", self.correct] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Restart", nil];
        alert.tag = 1;
        [alert show];
    }
    else {
        self.consumed --;
        self.timerLabel.text = [NSString stringWithFormat:@"%d", self.consumed];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTick:) userInfo:nil repeats:NO];
        
    }
    [theTimer invalidate];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog(@"Retake");
    self.currentQuestion = 0;
    self.correct=0;
    self.incorrect=0;
    [self updateResult];
    self.consumed=5;
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                  target: self
                                                selector:@selector(onTick:)
                                                userInfo: nil repeats:YES];
    //  [alertView release];
    
}




- (void) makeClickable
{
    self.optionAButton.enabled = YES;
    self.optionBButton.enabled = YES;
    self.optionCButton.enabled = YES;
    self.optionDButton.enabled = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
