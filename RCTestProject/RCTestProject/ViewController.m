//
//  ViewController.m
//  RCTestProject
//
//  Created by Roman Gal on 15.06.17.
//  Copyright © 2017 cubik. All rights reserved.
//

#import "ViewController.h"

#import "RCStandardCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *names;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Test controller";
    
    // Всегда вызывается
    [self standarOrder];
    
    // 2.
//     [self revertOrder];
    
    // 3.
    // [self anySecond];
    
    UINib *nib = [UINib nibWithNibName:@"RCStandardCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RCStandardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.customLabel.text = self.names[indexPath.row];
    
    return cell;
}

- (void)standarOrder {
    self.names = @[@"Roma", @"Tom", @"Jhon", @"Max", @"Ann", @"Jack"];
    // Добавить фамилии
}

- (void)revertOrder {
    
}

- (void)anySecond {
    
}


// Задачи

// 1. Создать дополнительный UILabel на ячейке. Создать массив фамилий (6 штук). Старый сдвинуть. Не забыть про constaraints. Установить фамилии в новый лэйбл на ячейках.
// 2. Перевернуть массивы имен и фамилий и тоже это все вывести
// 3. Каждого второго вывести


@end
