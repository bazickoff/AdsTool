.class Landroid/support/t4/widget/MaterialProgressDrawable$3;
.super Ljava/lang/Object;
.source "MaterialProgressDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/t4/widget/MaterialProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/t4/widget/MaterialProgressDrawable;


# direct methods
.method constructor <init>(Landroid/support/t4/widget/MaterialProgressDrawable;)V
    .locals 0
    .param p1, "this$0"    # Landroid/support/t4/widget/MaterialProgressDrawable;

    .prologue
    .line 449
    iput-object p1, p0, Landroid/support/t4/widget/MaterialProgressDrawable$3;->this$0:Landroid/support/t4/widget/MaterialProgressDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 452
    iget-object v0, p0, Landroid/support/t4/widget/MaterialProgressDrawable$3;->this$0:Landroid/support/t4/widget/MaterialProgressDrawable;

    invoke-virtual {v0}, Landroid/support/t4/widget/MaterialProgressDrawable;->invalidateSelf()V

    .line 453
    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 457
    iget-object v0, p0, Landroid/support/t4/widget/MaterialProgressDrawable$3;->this$0:Landroid/support/t4/widget/MaterialProgressDrawable;

    invoke-virtual {v0, p2, p3, p4}, Landroid/support/t4/widget/MaterialProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 458
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 462
    iget-object v0, p0, Landroid/support/t4/widget/MaterialProgressDrawable$3;->this$0:Landroid/support/t4/widget/MaterialProgressDrawable;

    invoke-virtual {v0, p2}, Landroid/support/t4/widget/MaterialProgressDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 463
    return-void
.end method