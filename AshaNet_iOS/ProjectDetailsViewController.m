//
//  ProjectDetailsViewController.m
//  AshaNet_iOS
//
//  Created by Savla, Sumit on 7/5/14.
//  Copyright (c) 2014 Patil, Sagar. All rights reserved.
//

#import "ProjectDetailsViewController.h"
#import "ProjectDonateViewController.h"
#import "LoginViewController.h"
@interface ProjectDetailsViewController ()

@property UIBarButtonItem *rightButton;
@property (weak, nonatomic) IBOutlet UITextView *typeTextView;
@property (weak, nonatomic) IBOutlet UITextView *focusTextView;
@property (weak, nonatomic) IBOutlet UITextView *areaTextView;
@property (weak, nonatomic) IBOutlet UITextView *chapterTextView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextView *purposeTextView;
@property (weak, nonatomic) IBOutlet UITextView *yearTextView;

- (IBAction)onDonateTap:(id)sender;
- (IBAction)onLoginTap:(id)sender;

@end

@implementation ProjectDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.project.name;
    
    self.rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Share" style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton:)];
    self.navigationItem.rightBarButtonItem = self.rightButton;
    NSInteger idx = [self.project.projectType integerValue];
    self.typeTextView.text = Project.TYPES[idx];
    idx = [self.project.focus integerValue];
    self.focusTextView.text = Project.PRIMARY_FOCUSES[idx];
    self.areaTextView.text = self.project.area;
    self.descriptionTextView.text = self.project.description;
    self.chapterTextView.text = self.project.chapter;
    self.purposeTextView.text= self.project.purpose;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY"];
    self.yearTextView.text = [NSString stringWithFormat:@"%@",  [formatter stringFromDate:self.project.year]];
    
}

- (IBAction)onRightButton:(id)sender
{
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    [sharingItems addObject:@"Project information"];
    [sharingItems addObject:@"http://www.ashanet.org/projects/project-view.php?p=855"];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDonateTap:(id)sender {
    ProjectDonateViewController *prjVC = [[ProjectDonateViewController alloc]initWithNibName:@"ProjectDonateViewController" bundle:nil];
    prjVC.projectName = self.project.name;
    [self presentViewController:prjVC animated:YES completion:nil];
    
    
}

- (IBAction)onLoginTap:(id)sender {
    LoginViewController *lVC = [[LoginViewController alloc]init];
    [self presentViewController:lVC animated:YES completion:nil];
}
@end
