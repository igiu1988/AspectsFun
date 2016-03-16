//
//  ViewController.m
//  test
//
//  Created by wangyang on 16/2/29.
//  Copyright © 2016年 北京更美互动信息科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "Aspects.h"
#import <objc/runtime.h>
#import "test-swift.h"

@interface ViewController ()
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, copy) NSString *string;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self aspect_hookSelector:@selector(doSomething:and:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, NSString *name) {
            NSLog(@"igiuisbest");
            UIViewController *controller = info.instance;

            Class baseClass = object_getClass(controller);
            printf("%s\n", class_getName(baseClass));
            unsigned int methodListCount = 0;
            Method *methodList = class_copyMethodList(baseClass, &methodListCount);

            // sel_getName(method_getName(method))
            for (int i = 0; i < methodListCount; i ++, methodList++) {
                Method met = *methodList;
                const char *encoding = method_getTypeEncoding(met);
                const char *selName = sel_getName(method_getName(met));
                printf("sel name:%s, \t\tencoding:%s\n", selName,  encoding);
            }

        }error:NULL];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

//    // Tq,N,V_number
//    self.number = 10;
//
//    // T@"NSString",C,N,V_string
//    self.string = @"haha";
//
//    const char * type = property_getAttributes(class_getProperty([self class], "number"));
//
//    printf("%s", type);
//
//
//    [self doSomething:@"bbbb" and:5];


}

- (IBAction)action1 {
    DoctorController *c = [DoctorController new];
    [self presentViewController:c animated:YES completion:^{
    }];

}

- (IBAction)action2 {
    SearchDoctorController *c = [SearchDoctorController new];
    [self presentViewController:c animated:YES completion:^{
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [super forwardInvocation:anInvocation];

    NSLog(@"wangyang forwardInvocation");
}

- (void)doSomething:(NSString *)something and:(NSInteger)num {
    NSLog(@"aaa");
}
@end
