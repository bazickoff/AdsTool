.class Linfo/mtad/MTFullActivity$1;
.super Landroid/os/CountDownTimer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linfo/mtad/MTFullActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Linfo/mtad/MTFullActivity;


# direct methods
.method constructor <init>(Linfo/mtad/MTFullActivity;JJ)V
    .locals 0

    iput-object p1, p0, Linfo/mtad/MTFullActivity$1;->a:Linfo/mtad/MTFullActivity;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 1

    iget-object v0, p0, Linfo/mtad/MTFullActivity$1;->a:Linfo/mtad/MTFullActivity;

    invoke-static {v0}, Linfo/mtad/MTFullActivity;->a(Linfo/mtad/MTFullActivity;)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    return-void
.end method

.method public onTick(J)V
    .locals 4

    const-wide/16 v0, 0x1b58

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const-wide/16 v0, 0x2328

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    const-string v0, "U2FtcGxlIGFkIHVuaXQgSUQ="

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v2

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    :goto_0
    iget-object v2, p0, Linfo/mtad/MTFullActivity$1;->a:Linfo/mtad/MTFullActivity;

    invoke-static {v2}, Linfo/mtad/MTFullActivity;->a(Linfo/mtad/MTFullActivity;)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Linfo/mtad/MTFullActivity$1;->a:Linfo/mtad/MTFullActivity;

    invoke-static {v0}, Linfo/mtad/MTFullActivity;->a(Linfo/mtad/MTFullActivity;)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

