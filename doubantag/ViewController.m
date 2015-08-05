//
//  ViewController.m
//  doubantag
//
//  Created by Bobo Shone on 15/8/5.
//
//

#import "ViewController.h"
#import "DoubanTagView.h"

@interface ViewController ()

@property (nonatomic, strong) DoubanTagView *doubanTagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!self.doubanTagView) {
        NSArray *testTags = @[@"纹样", @"射手座", @"攀岩", @"面试", @"美国文学", @"职场", @"马杀鸡"];
        
        self.doubanTagView = [[DoubanTagView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.doubanTagView];
        [self.doubanTagView setTags:testTags tapHandler:^(NSInteger tagIndex) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[testTags objectAtIndex:tagIndex]
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles:nil];
            [alert show];
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
