.class Landroid/support/t4/view/MotionEventCompat$HoneycombMr1MotionEventVersionImpl;
.super Landroid/support/t4/view/MotionEventCompat$BaseMotionEventVersionImpl;
.source "MotionEventCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/t4/view/MotionEventCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HoneycombMr1MotionEventVersionImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Landroid/support/t4/view/MotionEventCompat$BaseMotionEventVersionImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public getAxisValue(Landroid/view/MotionEvent;I)F
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "axis"    # I

    .prologue
    .line 63
    invoke-static {p1, p2}, Landroid/support/t4/view/MotionEventCompatHoneycombMr1;->getAxisValue(Landroid/view/MotionEvent;I)F

    move-result v0

    return v0
.end method

.method public getAxisValue(Landroid/view/MotionEvent;II)F
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "axis"    # I
    .param p3, "pointerIndex"    # I

    .prologue
    .line 68
    invoke-static {p1, p2, p3}, Landroid/support/t4/view/MotionEventCompatHoneycombMr1;->getAxisValue(Landroid/view/MotionEvent;II)F

    move-result v0

    return v0
.end method
