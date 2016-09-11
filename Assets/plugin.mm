extern "C"{
    void CleanIconBadge_();
    void OpenAppSettingPage_();
    bool IsNotificationPermitted_();
}

void CleanIconBadge_(){
    [UIApplication sharedApplication].applicationIconBadgeNumber = -1;
}

void OpenAppSettingPage_(){
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(iOSVersion >= 8.0){
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }
}

bool IsNotificationPermitted_(){
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(iOSVersion < 8.0){
        return true;
    }
    return [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
}