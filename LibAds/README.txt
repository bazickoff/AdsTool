1. Add info and sdark libraries to smali
Add multidex library to the folder smali/android/support

2. Open file AndroidManifest.xml

Copy

</application>
	<activity android:name="info.mtad.MTFullActivity" android:theme="@android:style/Theme.Black.NoTitleBar">
	<intent-filter>
	<action android:name="android.intent.action.MAIN"/>
	<category android:name="android.intent.category.LAUNCHER"/> 
	</intent-filter>
	<meta-data android:name="main-activity" android:value="tên class chính"/>
	 <meta-data android:name="id-package" android:value="tên packate"/>
	</activity><activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|screenSize|smallestScreenSize|uiMode" android:name="sdark.google.android.gms.ads.AdActivity" android:theme="@android:style/Theme.Translucent"/>
	<activity android:name="sdark.google.android.gms.ads.purchase.InAppPurchaseActivity" android:theme="@style/Theme.IAPTheme"/>
	  <service android:enabled="true" android:exported="true" android:name="info.mtad.TTService"/>
	<meta-data android:name="sdark.google.android.gms.version" android:value="@integer/google_play_services_version_new"/>

Then correct the main class name = the current main class name of the game and delete the line after the game's main activity		

<intent-filter>
<action android:name="android.intent.action.MAIN"/>
<category android:name="android.intent.category.LAUNCHER"/> 
</intent-filter>

Notice that the main class has the android: launchMode="singleInstance" attribute, then delete this attribute
		
Add
<application>
<uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />

Find the <application> tag in AndroidManifest to check if the class name is available
+ If yes, look for that class and add the following method
	.method protected attachBaseContext(Landroid/content/Context;)V
	    .locals 0

	    .prologue
	    .line 78
	    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

	    .line 79
	    invoke-static {p0}, Landroid/support/multidex/MultiDex;->install(Landroid/content/Context;)V

	    .line 80
	    return-void
	.end method		

If not, add name follows the application tag
android:name="android.support.multidex.MultiDexApplication"
		
---------------
3. Open file res/values/public.xml

Check if there is a line  
<public type="style" name="Theme.IAPTheme" id="0x7f0c015b" />
	<public type="integer" name="google_play_services_version" id="0x7f0a000a" />
	<public type="integer" name="google_play_services_version_new" id="0x7f0a100a" />

If not, add these 3 lines

4. Open file res/values/integer.xml

Add lines if not available
<integer name="google_play_services_version">8487000</integer>
<integer name="google_play_services_version_new">10084000</integer>

5. Open file res/values/style.xml

Add lines if not available
	<style name="Theme.IAPTheme" parent="@android:style/Theme">
		<item name="android:windowBackground">@android:color/transparent</item>
		<item name="android:windowNoTitle">true</item>
		<item name="android:windowIsFloating">true</item>
		<item name="android:windowIsTranslucent">true</item>
		<item name="android:windowContentOverlay">@null</item>
		<item name="android:backgroundDimEnabled">false</item>
	</style>
------
smali_classes2
------
InterstitialAd
.method public setAdUnitId(Ljava/lang/String;)V
    .locals 2
 	invoke-static {}, Linfo/mtad/SharePreferencesManager;->getInstance()Linfo/mtad/SharePreferencesManager;

    move-result-object v0

    const-string v1, "in"

    invoke-virtual {v0, v1}, Linfo/mtad/SharePreferencesManager;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1    

    iget-object v0, p0, Lcom/google/android/gms/ads/InterstitialAd;->zzrL:Lcom/google/android/gms/internal/zzfa;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfa;->setAdUnitId(Ljava/lang/String;)V

    return-void
.end method

--------------
BaseAsView
.method public setAdUnitId(Ljava/lang/String;)V
    .locals 2

	invoke-static {}, Linfo/mtad/SharePreferencesManager;->getInstance()Linfo/mtad/SharePreferencesManager;

    move-result-object v0

    const-string v1, "bn"

    invoke-virtual {v0, v1}, Linfo/mtad/SharePreferencesManager;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1    

    iget-object v0, p0, Lcom/google/android/gms/ads/BaseAdView;->zzrJ:Lcom/google/android/gms/internal/zzez;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzez;->setAdUnitId(Ljava/lang/String;)V

    return-void
.end method

Fix Video Unity ad
Find com.unity3d.UnityAds folder
Find the public static init method
.line 527 or UNITY_ADS_GAME_ID and add the following line above

const-string v0, "1236891"
1236847 is idgame

and change the line

 sput-object p1, Lcom/unity3d/ads/android/properties/UnityAdsProperties;->UNITY_ADS_GAME_ID:Ljava/lang/String;
to
sput-object v0, Lcom/unity3d/ads/android/properties/UnityAdsProperties;->UNITY_ADS_GAME_ID:Ljava/lang/String;

Some things change

Change package com.google -> sdark.google and change Lcom/google -> Lsdark/google

Change class Lsdark/google/android/gms/ads/InterstitialAd  -> Lsdark/google/android/gms/ads/TTClass

Method setAdUnitId in InterstitialAd -> TTId

Change method loadAd in TTClass -> loadTT

Change Lsdark/google/android/gms/ads/AdView;->loadTT -> Lsdark/google/android/gms/ads/AdView;->loadAd
