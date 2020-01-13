.class public Linfo/mtad/a/a;
.super Landroid/os/AsyncTask;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field private b:Linfo/mtad/a/b;

.field private c:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Linfo/mtad/a/b;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Linfo/mtad/a/a;->a:Ljava/lang/String;

    iput-object p1, p0, Linfo/mtad/a/a;->c:Landroid/content/Context;

    iput-object p2, p0, Linfo/mtad/a/a;->b:Linfo/mtad/a/b;

    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0
.end method

.method protected a(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    const-string v0, "Y2EtYXBwLXB1Yi0zOTQwMjU2MDk5OTQyNTQ0LzEwMzMxNzM3MTJAY2EtYXBwLXB1Yi0zOTQwMjU2MDk5OTQyNTQ0LzEwMzMxNzM3MTI="
	
    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iget-object v2, p0, Linfo/mtad/a/a;->b:Linfo/mtad/a/b;

    invoke-interface {v2, v1}, Linfo/mtad/a/b;->c(Ljava/lang/String;)V

    return-void
.end method

.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Linfo/mtad/a/a;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Linfo/mtad/a/a;->a(Ljava/lang/String;)V

    return-void
.end method
