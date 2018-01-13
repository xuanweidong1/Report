//
//  SeaElectionViewController.m
//  Report
//
//  Created by tcx on 2018/1/11.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "SeaElectionViewController.h"
#import "MenuScreeningView.h"
#import "XWDAFNManager.h"
#import <SDAutoLayout.h>
#import "OpenTest.h"

@interface SeaElectionViewController ()<ProtocolDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) MenuScreeningView *menuScreeningView;  //条件选择器
@property (nonatomic, strong) UITableView *tableView;//tableview
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *resultArray;

@end

@implementation SeaElectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"海选院校";
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    self.menuScreeningView = [[MenuScreeningView alloc] init];
    self.menuScreeningView.delegate = self;
    [self.view addSubview:self.menuScreeningView];
    self.menuScreeningView.backgroundColor = [UIColor whiteColor];
    
    _menuScreeningView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, rectStatus.size.height + 49)
    .heightIs(40);
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    
    _tableView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(_menuScreeningView, 0)
    .bottomSpaceToView(self.view, 0);
    
    
    [self initData];
    
    
    
}


//协议回调
- (void)didSelectMenuItem:(NSString *)str {
   
    
}


- (void)initData {
    _dataArray = [NSMutableArray new];
    _resultArray = [NSMutableArray new];
    
//    NSMutableArray *secondArray1 = [NSMutableArray new];
//
//    NSArray *FirstTitleArray = @[@"哈尔滨工业大学", @"哈尔滨工程大学", @"东北农业大学", @"黑龙江大学"];
//    NSArray *SecondTitleArray = @[@"土木工程", @"生物技术", @"经济管理学"];
//
//    NSArray *imageArray = @[@"scroller1", @"scroller2", @"scroller3", @"scroller4"];
    
   
    
    
    
    NSArray *array = @[
                       @{@"university":@"哈尔滨工业大学",
                         @"id":@"10245",
                         @"speciality":@[@"土木工程", @"生物技术"]
                         },
                       @{@"university":@"哈尔滨工程大学",
                         @"id":@"10245",
                         @"speciality":@[@"工商管理",@"学前教育"]
                         },
                       @{@"university":@"哈尔滨工程大学",
                         @"id":@"10245",
                         @"speciality":@[@"环境工程",@"对外汉语"]
                         }
                       ];
    
//    NSDictionary *dic =@{
//                         @"哈尔滨工业大学":@[@"土木工程", @"生物技术"],
//                         @"哈尔滨工程大学":@[@"工商管理",@"学前教育"],
//                         @"东北农业大学":@[@"环境工程",@"对外汉语"]
//                         };
    
    
    
//    //第二层数据
//    for (int i = 0; i < SecondTitleArray.count; i++) {
//        OpenTest *model = [[OpenTest alloc] init];
//        model.title = SecondTitleArray[i];
//        model.level = 1;
//        model.isOpen = NO;
//
//        [secondArray1 addObject:model];
//    }
    
    //第一层数据
    for (int i = 0; i < array.count; i++) {
        OpenTest *model = [[OpenTest alloc] init];
        model.title = array[i][@"university"];
        model.level = 0;
        model.isOpen = NO;
        
        NSMutableArray *secondArray1 = [NSMutableArray new];
        for (NSString *string in array[i][@"speciality"]) {
            
            OpenTest *model = [[OpenTest alloc] init];
            model.title = string;
            model.level = 1;
            model.isOpen = NO;
            
            [secondArray1 addObject:model];
            
        }
 
        model.detailArray = [secondArray1 mutableCopy];
//        model.imageName = imageArray[i];
        
        [_dataArray addObject:model];
    }
    //处理源数据，获得展示数组_resultArray
    [self dealWithDataArray:_dataArray];
}
/**
 将源数据数组处理成要展示的一维数组，最开始是展示首层的所有的数据
 @param dataArray 源数据数组
 */
- (void)dealWithDataArray:(NSMutableArray *)dataArray {
    for (OpenTest *model in dataArray) {
        [_resultArray addObject:model];
        
        if (model.isOpen && model.detailArray.count > 0) {
            [self dealWithDataArray:model.detailArray];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    if (indexPath.row < _resultArray.count) {
        OpenTest *model = _resultArray[indexPath.row];
        cell.textLabel.text = model.title;
        cell.indentationLevel = model.level; //调整内容缩进
        cell.indentationWidth = 10.0;//每级宽度
        
    }
    
    
    return cell;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _resultArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    OpenTest *model = _resultArray[row];
    
    if (model.isOpen) {
        //原来是展开的，现在要收起,则删除model.detailArray存储的数据
        [self deleteObjectWithDataArray:model.detailArray count:0];
    }
    else {
        if (model.detailArray.count > 0) {
            //原来是收起的，现在要展开，则需要将同层次展开的收起，然后再展开
            [self compareSameLevelWithModel:model row:row];
        }
        else {
            //点击的是最后一层数据，跳转到别的界面
            NSLog(@"最后一层");
        }
    }
    
    model.isOpen = !model.isOpen;
    
    //滑动到屏幕顶部
    for (int i = 0; i < _resultArray.count; i++) {
        OpenTest *openModel = _resultArray[i];
        
        if (openModel.isOpen && openModel.level == 0) {
            //将点击的cell滑动到屏幕顶部
            NSIndexPath *selectedPath = [NSIndexPath indexPathForRow:i inSection:0];
            [tableView scrollToRowAtIndexPath:selectedPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    }
    
    [tableView reloadData];
}



/**
 在指定位置插入要展示的数据
 @param dataArray 数据数组
 @param row       需要插入的数组下标
 */
- (void)addObjectWithDataArray:(NSMutableArray *)dataArray row:(NSInteger)row {
    for (int i = 0; i < dataArray.count; i++) {
        OpenTest *model = dataArray[i];
        model.isOpen = NO;
        [_resultArray insertObject:model atIndex:row];
        row += 1;
    }
}
/**
 删除要收起的数据
 @param dataArray 数据
 @param count     统计删除数据的个数
 @return 删除数据的个数
 */
- (CGFloat)deleteObjectWithDataArray:(NSMutableArray *)dataArray count:(NSInteger)count {
    for (OpenTest *model in dataArray) {
        count += 1;
        
        if (model.isOpen && model.detailArray.count > 0) {
            count = [self deleteObjectWithDataArray:model.detailArray count:count];
        }
        
        model.isOpen = NO;
        
        [_resultArray removeObject:model];
    }
    
    return count;
}

/**
 与点击同一层的数据比较，然后删除要收起的数据和插入要展开的数据
 @param model 点击的cell对应的model
 @param row   点击的在tableview的indexPath.row,也对应_resultArray的下标
 */
- (void)compareSameLevelWithModel:(OpenTest *)model row:(NSInteger)row {
    NSInteger count = 0;
    NSInteger index = 0;    //需要收起的起始位置
    //如果直接用_resultArray，在for循环为完成之前，_resultArray会发生改变，使程序崩溃。
    NSMutableArray *copyArray = [_resultArray mutableCopy];
    
    for (int i = 0; i < copyArray.count; i++) {
        OpenTest *openModel = copyArray[i];
        if (openModel.level == model.level) {
            //同一个层次的比较
            if (openModel.isOpen) {
                //删除openModel所有的下一层
                count = [self deleteObjectWithDataArray:openModel.detailArray count:count];
                index = i;
                openModel.isOpen = NO;
                break;
            }
        }
    }
    
    //插入的位置在删除的位置的后面，则需要减去删除的数量。
    if (row > index && row > count) {
        row -= count;
    }
    
    [self addObjectWithDataArray:model.detailArray row:row + 1];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
