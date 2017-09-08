//
//  ViewController.m
//  TestFMDB
//
//  Created by 赵铭 on 2017/9/7.
//  Copyright © 2017年 zm. All rights reserved.
//

#import "ViewController.h"


#import <FMDB/FMDB.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/mySqlite.sqlite"];
    NSLog(@"%@", path);
    FMDatabase * db = [FMDatabase databaseWithPath:path];
    BOOL openS = [db open];
    if (openS) {
        NSLog(@"打开成功");
        /*
        CREATE  TABLE  IF NOT EXISTS "customers" ("cust_id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL , "cust_name" CHAR NOT NULL , "cust_address" CHAR DEFAULT china)
         */
      NSString * s = [NSString stringWithFormat:@"create table if not exists customers (cust_id integer primary key autoincrement not null, cust_name char not null , cust_address char null DEFAULT china)"];
       BOOL createTableS = [db executeUpdate:s];
        if (createTableS) {
            NSLog(@"创建表成功");
        }
    }
//    //删除
//    NSString * s1 = @"delete from customers where cust_id = ?";
//    BOOL is = [db executeUpdate:s1, @"1"];
//    if (is) {
//        NSLog(@"删除成功");
//    }

//    //更新
//    NSString * s1 = @"update customers set cust_address = ?, cust_name = ? where cust_id = 1";
//    BOOL is = [db executeUpdate:s1, @"qaq", @"huoxing"];
//    if (is) {
//        NSLog(@"插入成功");
//    }

    //查询
    NSString * s1 = @"select cust_name from customers";
    FMResultSet * s = [db executeQuery:s1];
    while ([s next]) {
        NSLog(@"name = %@", [s stringForColumn:@"cust_address"]);
    }
//    if (is) {
//        NSLog(@"插入成功");
//    }

    
//    //插入单行
//    NSString * s1 = @"insert into customers (cust_name, cust_address) values ('zm2', 'china2')";
//    BOOL is = [db executeUpdate:s1];
//    if (is) {
//        NSLog(@"插入成功");
//    }
    

//    //插入多行 不支持
//    NSString * s1 = @"insert into customers (cust_name, cust_address) values ('tim', 'russian'), ('zm, china')";
//    BOOL is = [db executeUpdate:s1];
//    if (is) {
//        NSLog(@"插入多行成功");
//    }
    
    
//    NSString * s1 = @"alter table customers add cust_phone char";
//    BOOL adds = [db executeUpdate:s1];
//    if (adds) {
//        NSLog(@"添加cust_phone成功");
//    }
//    
////    NSString *s2 = @"drop table customers";
////    BOOL ds = [db executeUpdate:s2];
////    if (ds) {
////        NSLog(@"删除表成功");
////    }
//    
//    NSString * s3 = @"alter table customers rename to newCustoms";
//    BOOL rs = [db executeUpdate:s3];
//    if (rs) {
//        NSLog(@"重命名成功");
//    }
    
//    NSString * s2 = @"alter table customers drop column cust_phone";
//    BOOL ds = [db executeUpdate:s2];
//    if (ds) {
//        NSLog(@"删除cust_phone成功");
//    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
