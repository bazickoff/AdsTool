.class final Lsdark/google/android/gms/security/ProviderInstaller$1;
.super Landroid/os/AsyncTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lsdark/google/android/gms/security/ProviderInstaller;->installIfNeededAsync(Landroid/content/Context;Lsdark/google/android/gms/security/ProviderInstaller$ProviderInstallListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzbCc:Lsdark/google/android/gms/security/ProviderInstaller$ProviderInstallListener;

.field final synthetic zztd:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Lsdark/google/android/gms/security/ProviderInstaller$ProviderInstallListener;)V
    .locals 0

    iput-object p1, p0, Lsdark/google/android/gms/security/ProviderInstaller$1;->zztd:Landroid/content/Context;

    iput-object p2, p0, Lsdark/google/android/gms/security/ProviderInstaller$1;->zzbCc:Lsdark/google/android/gms/security/ProviderInstaller$ProviderInstallListener;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lsdark/google/android/gms/security/ProviderInstaller$1;->zzc([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lsdark/google/android/gms/security/ProviderInstaller$1;->zzg(Ljava/lang/Integer;)V

    return-void
.end method

.method protected varargs zzc([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 1

    :try_start_0
    iget-object v0, p0, Lsdark/google/android/gms/security/ProviderInstaller$1;->zztd:Landroid/content/Context;

    invoke-static {v0}, Lsdark/google/android/gms/security/ProviderInstaller;->installIfNeeded(Landroid/content/Context;)V
    :try_end_0
    .catch Lsdark/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lsdark/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lsdark/google/android/gms/common/GooglePlayServicesRepairableException;->getConnectionStatusCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :catch_1
    move-exception v0

    iget v0, v0, Lsdark/google/android/gms/common/GooglePlayServicesNotAvailableException;->errorCode:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method protected zzg(Ljava/lang/Integer;)V
    .locals 4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lsdark/google/android/gms/security/ProviderInstaller$1;->zzbCc:Lsdark/google/android/gms/security/ProviderInstaller$ProviderInstallListener;

    invoke-interface {v0}, Lsdark/google/android/gms/security/ProviderInstaller$ProviderInstallListener;->onProviderInstalled()V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lsdark/google/android/gms/security/ProviderInstaller;->zzOc()Lsdark/google/android/gms/common/zzc;

    move-result-object v0

    iget-object v1, p0, Lsdark/google/android/gms/security/ProviderInstaller$1;->zztd:Landroid/content/Context;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string v3, "pi"

    invoke-virtual {v0, v1, v2, v3}, Lsdark/google/android/gms/common/zzc;->zzb(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lsdark/google/android/gms/security/ProviderInstaller$1;->zzbCc:Lsdark/google/android/gms/security/ProviderInstaller$ProviderInstallListener;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v1, v2, v0}, Lsdark/google/android/gms/security/ProviderInstaller$ProviderInstallListener;->onProviderInstallFailed(ILandroid/content/Intent;)V

    goto :goto_0
.end method
