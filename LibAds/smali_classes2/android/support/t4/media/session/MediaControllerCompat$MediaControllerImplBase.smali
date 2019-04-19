.class Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;
.super Ljava/lang/Object;
.source "MediaControllerCompat.java"

# interfaces
.implements Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/t4/media/session/MediaControllerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MediaControllerImplBase"
.end annotation


# instance fields
.field private mBinder:Landroid/support/t4/media/session/IMediaSession;

.field private mToken:Landroid/support/t4/media/session/MediaSessionCompat$Token;

.field private mTransportControls:Landroid/support/t4/media/session/MediaControllerCompat$TransportControls;


# direct methods
.method public constructor <init>(Landroid/support/t4/media/session/MediaSessionCompat$Token;)V
    .locals 1
    .param p1, "token"    # Landroid/support/t4/media/session/MediaSessionCompat$Token;

    .prologue
    .line 893
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 894
    iput-object p1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mToken:Landroid/support/t4/media/session/MediaSessionCompat$Token;

    .line 895
    invoke-virtual {p1}, Landroid/support/t4/media/session/MediaSessionCompat$Token;->getToken()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/IBinder;

    invoke-static {v0}, Landroid/support/t4/media/session/IMediaSession$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/t4/media/session/IMediaSession;

    move-result-object v0

    iput-object v0, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    .line 896
    return-void
.end method


# virtual methods
.method public adjustVolume(II)V
    .locals 4
    .param p1, "direction"    # I
    .param p2, "flags"    # I

    .prologue
    .line 1056
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    const/4 v2, 0x0

    invoke-interface {v1, p1, p2, v2}, Landroid/support/t4/media/session/IMediaSession;->adjustVolume(IILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1060
    :goto_0
    return-void

    .line 1057
    :catch_0
    move-exception v0

    .line 1058
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in adjustVolume. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dispatchMediaButtonEvent(Landroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 931
    if-nez p1, :cond_0

    .line 932
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "event may not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 935
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1, p1}, Landroid/support/t4/media/session/IMediaSession;->sendMediaButton(Landroid/view/KeyEvent;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 939
    :goto_0
    const/4 v1, 0x0

    return v1

    .line 936
    :catch_0
    move-exception v0

    .line 937
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in dispatchMediaButtonEvent. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 4

    .prologue
    .line 994
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getExtras()Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 998
    :goto_0
    return-object v1

    .line 995
    :catch_0
    move-exception v0

    .line 996
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getExtras. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 998
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getFlags()J
    .locals 4

    .prologue
    .line 1014
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getFlags()J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 1018
    :goto_0
    return-wide v2

    .line 1015
    :catch_0
    move-exception v0

    .line 1016
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getFlags. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1018
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public getMediaController()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1084
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMetadata()Landroid/support/t4/media/MediaMetadataCompat;
    .locals 4

    .prologue
    .line 964
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getMetadata()Landroid/support/t4/media/MediaMetadataCompat;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 968
    :goto_0
    return-object v1

    .line 965
    :catch_0
    move-exception v0

    .line 966
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getMetadata. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 968
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1075
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getPackageName()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 1079
    :goto_0
    return-object v1

    .line 1076
    :catch_0
    move-exception v0

    .line 1077
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getPackageName. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1079
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getPlaybackInfo()Landroid/support/t4/media/session/MediaControllerCompat$PlaybackInfo;
    .locals 8

    .prologue
    .line 1024
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getVolumeAttributes()Landroid/support/t4/media/session/ParcelableVolumeInfo;

    move-result-object v7

    .line 1025
    .local v7, "info":Landroid/support/t4/media/session/ParcelableVolumeInfo;
    new-instance v0, Landroid/support/t4/media/session/MediaControllerCompat$PlaybackInfo;

    iget v1, v7, Landroid/support/t4/media/session/ParcelableVolumeInfo;->volumeType:I

    iget v2, v7, Landroid/support/t4/media/session/ParcelableVolumeInfo;->audioStream:I

    iget v3, v7, Landroid/support/t4/media/session/ParcelableVolumeInfo;->controlType:I

    iget v4, v7, Landroid/support/t4/media/session/ParcelableVolumeInfo;->maxVolume:I

    iget v5, v7, Landroid/support/t4/media/session/ParcelableVolumeInfo;->currentVolume:I

    invoke-direct/range {v0 .. v5}, Landroid/support/t4/media/session/MediaControllerCompat$PlaybackInfo;-><init>(IIIII)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1031
    .end local v7    # "info":Landroid/support/t4/media/session/ParcelableVolumeInfo;
    :goto_0
    return-object v0

    .line 1028
    :catch_0
    move-exception v6

    .line 1029
    .local v6, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getPlaybackInfo. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1031
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPlaybackState()Landroid/support/t4/media/session/PlaybackStateCompat;
    .locals 4

    .prologue
    .line 954
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getPlaybackState()Landroid/support/t4/media/session/PlaybackStateCompat;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 958
    :goto_0
    return-object v1

    .line 955
    :catch_0
    move-exception v0

    .line 956
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getPlaybackState. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 958
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getQueue()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/support/t4/media/session/MediaSessionCompat$QueueItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 974
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getQueue()Ljava/util/List;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 978
    :goto_0
    return-object v1

    .line 975
    :catch_0
    move-exception v0

    .line 976
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getQueue. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 978
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getQueueTitle()Ljava/lang/CharSequence;
    .locals 4

    .prologue
    .line 984
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getQueueTitle()Ljava/lang/CharSequence;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 988
    :goto_0
    return-object v1

    .line 985
    :catch_0
    move-exception v0

    .line 986
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getQueueTitle. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 988
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getRatingType()I
    .locals 4

    .prologue
    .line 1004
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getRatingType()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1008
    :goto_0
    return v1

    .line 1005
    :catch_0
    move-exception v0

    .line 1006
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getRatingType. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1008
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSessionActivity()Landroid/app/PendingIntent;
    .locals 4

    .prologue
    .line 1037
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->getLaunchPendingIntent()Landroid/app/PendingIntent;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 1041
    :goto_0
    return-object v1

    .line 1038
    :catch_0
    move-exception v0

    .line 1039
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in getSessionActivity. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1041
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getTransportControls()Landroid/support/t4/media/session/MediaControllerCompat$TransportControls;
    .locals 2

    .prologue
    .line 944
    iget-object v0, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mTransportControls:Landroid/support/t4/media/session/MediaControllerCompat$TransportControls;

    if-nez v0, :cond_0

    .line 945
    new-instance v0, Landroid/support/t4/media/session/MediaControllerCompat$TransportControlsBase;

    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-direct {v0, v1}, Landroid/support/t4/media/session/MediaControllerCompat$TransportControlsBase;-><init>(Landroid/support/t4/media/session/IMediaSession;)V

    iput-object v0, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mTransportControls:Landroid/support/t4/media/session/MediaControllerCompat$TransportControls;

    .line 948
    :cond_0
    iget-object v0, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mTransportControls:Landroid/support/t4/media/session/MediaControllerCompat$TransportControls;

    return-object v0
.end method

.method public registerCallback(Landroid/support/t4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V
    .locals 4
    .param p1, "callback"    # Landroid/support/t4/media/session/MediaControllerCompat$Callback;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 900
    if-nez p1, :cond_0

    .line 901
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "callback may not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 904
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 905
    iget-object v2, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    # getter for: Landroid/support/t4/media/session/MediaControllerCompat$Callback;->mCallbackObj:Ljava/lang/Object;
    invoke-static {p1}, Landroid/support/t4/media/session/MediaControllerCompat$Callback;->access$000(Landroid/support/t4/media/session/MediaControllerCompat$Callback;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/t4/media/session/IMediaControllerCallback;

    invoke-interface {v2, v1}, Landroid/support/t4/media/session/IMediaSession;->registerCallbackListener(Landroid/support/t4/media/session/IMediaControllerCallback;)V

    .line 906
    # invokes: Landroid/support/t4/media/session/MediaControllerCompat$Callback;->setHandler(Landroid/os/Handler;)V
    invoke-static {p1, p2}, Landroid/support/t4/media/session/MediaControllerCompat$Callback;->access$100(Landroid/support/t4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V

    .line 907
    const/4 v1, 0x1

    iput-boolean v1, p1, Landroid/support/t4/media/session/MediaControllerCompat$Callback;->mRegistered:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 912
    :goto_0
    return-void

    .line 908
    :catch_0
    move-exception v0

    .line 909
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in registerCallback. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 910
    invoke-virtual {p1}, Landroid/support/t4/media/session/MediaControllerCompat$Callback;->onSessionDestroyed()V

    goto :goto_0
.end method

.method public sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 4
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "params"    # Landroid/os/Bundle;
    .param p3, "cb"    # Landroid/os/ResultReceiver;

    .prologue
    .line 1065
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    new-instance v2, Landroid/support/t4/media/session/MediaSessionCompat$ResultReceiverWrapper;

    invoke-direct {v2, p3}, Landroid/support/t4/media/session/MediaSessionCompat$ResultReceiverWrapper;-><init>(Landroid/os/ResultReceiver;)V

    invoke-interface {v1, p1, p2, v2}, Landroid/support/t4/media/session/IMediaSession;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/t4/media/session/MediaSessionCompat$ResultReceiverWrapper;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1070
    :goto_0
    return-void

    .line 1067
    :catch_0
    move-exception v0

    .line 1068
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in sendCommand. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setVolumeTo(II)V
    .locals 4
    .param p1, "value"    # I
    .param p2, "flags"    # I

    .prologue
    .line 1047
    :try_start_0
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    const/4 v2, 0x0

    invoke-interface {v1, p1, p2, v2}, Landroid/support/t4/media/session/IMediaSession;->setVolumeTo(IILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1051
    :goto_0
    return-void

    .line 1048
    :catch_0
    move-exception v0

    .line 1049
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in setVolumeTo. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public unregisterCallback(Landroid/support/t4/media/session/MediaControllerCompat$Callback;)V
    .locals 4
    .param p1, "callback"    # Landroid/support/t4/media/session/MediaControllerCompat$Callback;

    .prologue
    .line 916
    if-nez p1, :cond_0

    .line 917
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "callback may not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 920
    :cond_0
    :try_start_0
    iget-object v2, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    .line 921
    # getter for: Landroid/support/t4/media/session/MediaControllerCompat$Callback;->mCallbackObj:Ljava/lang/Object;
    invoke-static {p1}, Landroid/support/t4/media/session/MediaControllerCompat$Callback;->access$000(Landroid/support/t4/media/session/MediaControllerCompat$Callback;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/t4/media/session/IMediaControllerCallback;

    .line 920
    invoke-interface {v2, v1}, Landroid/support/t4/media/session/IMediaSession;->unregisterCallbackListener(Landroid/support/t4/media/session/IMediaControllerCallback;)V

    .line 922
    iget-object v1, p0, Landroid/support/t4/media/session/MediaControllerCompat$MediaControllerImplBase;->mBinder:Landroid/support/t4/media/session/IMediaSession;

    invoke-interface {v1}, Landroid/support/t4/media/session/IMediaSession;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 923
    const/4 v1, 0x0

    iput-boolean v1, p1, Landroid/support/t4/media/session/MediaControllerCompat$Callback;->mRegistered:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 927
    :goto_0
    return-void

    .line 924
    :catch_0
    move-exception v0

    .line 925
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "MediaControllerCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dead object in unregisterCallback. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
