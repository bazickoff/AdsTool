.class public Linfo/mtad/TTService;
.super Landroid/app/Service;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Linfo/mtad/TTService$a;
    }
.end annotation


# instance fields
.field a:Z

.field b:Z

.field private c:Linfo/mtad/TTService$a;

.field private d:Landroid/os/Handler;

.field private e:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    iput-boolean v1, p0, Linfo/mtad/TTService;->a:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Linfo/mtad/TTService;->d:Landroid/os/Handler;

    new-instance v0, Linfo/mtad/TTService$1;

    invoke-direct {v0, p0}, Linfo/mtad/TTService$1;-><init>(Linfo/mtad/TTService;)V

    iput-object v0, p0, Linfo/mtad/TTService;->e:Ljava/lang/Runnable;

    iput-boolean v1, p0, Linfo/mtad/TTService;->b:Z

    return-void
.end method

.method static synthetic a(Linfo/mtad/TTService;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Linfo/mtad/TTService;->d:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreate()V
    .locals 0

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const-string v0, "TTSERVICE"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Linfo/mtad/TTService;->d:Landroid/os/Handler;

    iget-object v1, p0, Linfo/mtad/TTService;->e:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method
