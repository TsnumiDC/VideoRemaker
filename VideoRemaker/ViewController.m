//
//  ViewController.m
//  VideoRemaker
//
//  Created by Dylan Chen on 2018/7/5.
//  Copyright © 2018年 Dylan Chen. All rights reserved.
//

#import "ViewController.h"
#import "DelController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView * tableView;

@property (strong, nonatomic)NSArray * titlesArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configSubViews];
    
    [self layoutSubViews];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)configSubViews{
    
    self.title = @"菜单";
    [self.view addSubview:self.tableView];
}

- (void)layoutSubViews{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.top.equalTo(kNavBarHeight);
    }];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TSListCell * cell = [TSListCell cellWithTableView:tableView];
    NSString * title = self.titlesArray[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titlesArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            DelController * delVC = [DelController new];
            [self.navigationController pushViewController:delVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Init
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [UITableView new];
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)titlesArray{
    if (_titlesArray == nil) {
        _titlesArray = @[@"裁剪",@"拼接(前后)",@"多合一"];
    }
    return _titlesArray;
}

#pragma mark - dealloc

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end



@implementation TSListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    NSString * identifity = NSStringFromClass([self class]);
    [tableView registerClass:[self class] forCellReuseIdentifier:identifity];
    TSListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifity];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell==nil) {
        cell=[[TSListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifity];
    }
    return cell;
}
@end

