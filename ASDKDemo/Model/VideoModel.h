

/**
 * Copyright 2017 WHC_DataModelFactory
 * Auto-generated: 2017-12-04 16:04:10
 *
 * @author netyouli (whc)
 * @github https://github.com/netyouli
 */

#import <Foundation/Foundation.h>

@interface User_info :NSObject
@property (nonatomic , assign) NSInteger              user_type;
@property (nonatomic , assign) NSInteger              sex;
@property (nonatomic , copy) NSString              * username;
@property (nonatomic , copy) NSString              * user_id;
@property (nonatomic , copy) NSString              * motto;
@property (nonatomic , copy) NSString              * avatar;

@end

@interface Publish_files :NSObject
@property (nonatomic , assign) NSInteger              idx;
//@property (nonatomic , strong) Files              * files;
@property (nonatomic , copy) NSString              * vid;
//@property (nonatomic , strong) Files_mp4              * files_mp4;
@property (nonatomic , assign) NSInteger              duration;

@end

@interface VideoModel :NSObject
@property (nonatomic , assign) NSInteger              update_time;
@property (nonatomic , assign) NSInteger              user_type;
@property (nonatomic , assign) NSInteger              checked_time;
@property (nonatomic , copy) NSString              * flags;
@property (nonatomic , assign) NSInteger              auto_like;
@property (nonatomic , assign) NSInteger              edit_time;
@property (nonatomic , copy) NSString              * platform;
@property (nonatomic , assign) NSInteger              category;
@property (nonatomic , copy) NSString              * checker_name;
@property (nonatomic , assign) NSInteger              auto_like_cnt;
@property (nonatomic , assign) NSInteger              play_cnt;
//@property (nonatomic , assign) NSInteger              public;
@property (nonatomic , copy) NSString              * dar;
@property (nonatomic , assign) NSInteger              duration;
@property (nonatomic , copy) NSString              * checked_remark;
@property (nonatomic , copy) NSString              * version;
@property (nonatomic , assign) NSInteger              real_like_cnt;
@property (nonatomic , assign) NSInteger              like_cnt;
@property (nonatomic , assign) NSInteger              is_deleted;
@property (nonatomic , assign) NSInteger              priority;
@property (nonatomic , copy) NSString              * channel;
@property (nonatomic , assign) NSInteger              create_time;
@property (nonatomic , copy) NSString              * cover;
@property (nonatomic , assign) NSInteger              favorite_cnt;
@property (nonatomic , copy) NSString              * checker_id;
@property (nonatomic , copy) NSString              * raw_url;
@property (nonatomic , assign) NSInteger              publish_time;
@property (nonatomic , assign) NSInteger              height;
@property (nonatomic , assign) NSInteger              status;
@property (nonatomic , assign) NSInteger              trans_status;
@property (nonatomic , copy) NSString              * audit_role;
@property (nonatomic , copy) NSArray<NSString *>              * tags;
@property (nonatomic , strong) User_info              * user_info;
@property (nonatomic , copy) NSString              * user_id;
@property (nonatomic , copy) NSString              * desc;
@property (nonatomic , copy) NSString              * wid;
@property (nonatomic , copy) NSString              * reason;
@property (nonatomic , assign) NSInteger              audit_count;
@property (nonatomic , assign) NSInteger              comment_cnt;
@property (nonatomic , copy) NSArray<Publish_files *>              * publish_files;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * share_url;
@property (nonatomic , assign) NSInteger              share_cnt;
@property (nonatomic , assign) NSInteger              width;
@property (nonatomic , assign) NSInteger              is_sync_discover;

@end

