//
//  ViewController.m
//  csv01
//
//  Created by MAEDAHAJIME on 2015/06/19.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "ViewController.h"

// 接続
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *teString;

@end

// 実装
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

// CSV保存ボタン
- (IBAction)csvAction:(id)sender {
    
    NSMutableString* mstr = [[NSMutableString alloc] init];
    
    // 1行目だけ先に追加（見出し）
    [mstr insertString:@"id,data\n" atIndex:0];
    
    // カンマ区切りで追加
    for (int i = 0; i < 4; i++) {
        NSString* str = [NSString stringWithFormat:@"%@,%@\n",@"001", @"aaa"];
        // appendString文字列の後方へ追加
        [mstr appendString:str];
    }
    
    // ファイルパスの取得
    NSString *pth01 = (NSString *)
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, // ドキュメントディレクトリー
                                         NSUserDomainMask, // User
                                         YES) lastObject];
    NSString *pth02 = [pth01 stringByAppendingPathComponent:@"test.csv"];
    
    // 取得したNSStringをNSdataに変換
    NSData* out_data = [mstr dataUsingEncoding:NSUTF8StringEncoding];
    // ファイルに書きこむ
    [out_data writeToFile:pth02 atomically:YES];
    // テキスト画面に表示
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@", mstr];
}

@end
