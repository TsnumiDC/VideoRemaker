//
//  DelController.m
//  VideoRemaker
//
//  Created by Dylan Chen on 2018/7/5.
//  Copyright © 2018年 Dylan Chen. All rights reserved.
//

#import "DelController.h"
#import <Photos/Photos.h>

@interface DelController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIVideoEditorControllerDelegate>

@property (strong, nonatomic)UILabel * titleLabel;


@property (strong, nonatomic)UIButton * chooseBtn;//去相册选择

@property (strong, nonatomic)UIButton * editBtn;//去视频编辑

@end

@implementation DelController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configSubViews];
    
    [self layoutSubviews];
}

- (void)configSubViews{
    
    self.title = @"裁剪";

    [self.view addSubview:self.chooseBtn];
    [self.view addSubview:self.editBtn];
}

- (void)layoutSubviews{
    
    [self.chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(AdaptedWidth(120));
        make.height.equalTo(AdaptedWidth(64));
        make.centerX.equalTo(0);
        make.centerY.equalTo(0);
    }];
    
//    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(AdaptedWidth(120));
//        make.height.equalTo(AdaptedWidth(64));
//        make.top.equalTo(self.chooseBtn.mas_bottom);
//        make.centerX.equalTo(0);
//    }];
}

#pragma mark - Action

- (void)choosAction{
    
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    
    //判断系统是否允许选择 相册
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        //图片选择是相册（图片来源自相册）
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes = [NSArray arrayWithObjects:@"public.movie", @"public.image", nil];

        //设置代理
        picker.delegate=self;
        
        //模态显示界面
        [self presentViewController:picker animated:YES completion:nil];
        
    }
    
}

- (void)saveVideo:(NSString *)videoPath{
    
    if (videoPath) {
        
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoPath)) {
            //保存相册核心代码
            UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
        
    }
    
}
//保存视频完成之后的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"保存视频失败%@", error.localizedDescription);
    }
    else {
        NSLog(@"保存视频成功");
    }
    
}

#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //移除
    [picker dismissViewControllerAnimated:NO completion:nil];
    
    //通过key值获取到图片
//
//    PHAsset * asset  = info[UIImagePickerControllerPHAsset];
//
//    if (asset.mediaType == PHAssetMediaTypeVideo) {
//
//        NSLog(@"选的是视频");
//
//    }else{
//
//        NSLog(@"选的是图片");
//    }
    NSString* type = [info objectForKey:UIImagePickerControllerMediaType];
    //如果返回的type等于kUTTypeImage，代表返回的是照片,并且需要判断当前相机使用的sourcetype是拍照还是相册

    
    
    
//    UIImage * image =info[UIImagePickerControllerOriginalImage];
//
//    NSLog(@"image=%@  info=%@",image, info);
//
//
//
//    //判断数据源类型
//
    
    if ([type isEqualToString:@"public.movie"]) {
        
        
        //系统编辑
        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
        
        UIVideoEditorController *editVC;
        // 检查这个视频资源能不能被修改
        if ([UIVideoEditorController canEditVideoAtPath:videoURL.path]) {
            editVC = [[UIVideoEditorController alloc] init];
            editVC.videoPath = videoURL.path;
            editVC.delegate = self;
        }
        [self presentViewController:editVC animated:YES completion:nil];

        
        
        

    }else{
        NSLog(@"选择的不是视频");
    }
    if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {

        //设置图片背景
        NSLog(@"相册");
    }

    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {

        NSLog(@"相机");
    }
    
    

}

#pragma mark - UIVideoEditorControllerDelegate
//编辑成功后的Video被保存在沙盒的临时目录中
- (void)videoEditorController:(UIVideoEditorController *)editor didSaveEditedVideoToPath:(NSString *)editedVideoPath {
    NSLog(@"+++++++++++++++%@",editedVideoPath);
    
    //编辑成功
    
    [editor dismissViewControllerAnimated:NO completion:nil];

    [self saveVideo:editedVideoPath];
}

// 编辑失败后调用的方法
- (void)videoEditorController:(UIVideoEditorController *)editor didFailWithError:(NSError *)error {
    NSLog(@"%@",error.description);
    
}

//编辑取消后调用的方法
- (void)videoEditorControllerDidCancel:(UIVideoEditorController *)editor {
    [editor dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - Lazy
- (UIButton *)chooseBtn{
    if (_chooseBtn == nil) {
        _chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chooseBtn setTitle:@"点击选择视频" forState:UIControlStateNormal];
        [_chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_chooseBtn addTarget:self action:@selector(choosAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooseBtn;
}

- (UIButton *)editBtn{
    if (_editBtn == nil) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editBtn setTitle:@"点击编辑视频" forState:UIControlStateNormal];
        [_editBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_editBtn addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}
#pragma mark - dealloc
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
