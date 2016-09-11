using UnityEngine;
using System.Collections;

public class NotificationSample : MonoBehaviour {

    public void RegisterNotificationSettings(){
        IOSLocalNotification.RegisterNotificationSettings();
    }

    public void CheckNotificationRegistered(){
        if(IOSLocalNotification.IsNotificationPermitted()){
            Debug.Log("Notification settings registered");
        } else {
            Debug.Log("Notification settings NOT permitted");
        }
    }

    public void SetNotification(){
        IOSLocalNotification.SetNotification("Hello world", 10);
    }

    public void OpenApplicationSettings(){
        IOSLocalNotification.OpenAppSettingPage();
    }

    void OnApplicationPause(bool isPause){
        if(!isPause){
            IOSLocalNotification.CancelAllNotifications();
            IOSLocalNotification.CleanIconBadge();
        }
    }
}
