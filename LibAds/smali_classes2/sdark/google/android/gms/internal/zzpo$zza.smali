.class public Lsdark/google/android/gms/internal/zzpo$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsdark/google/android/gms/internal/zzpo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation


# instance fields
.field public final count:I

.field public final name:Ljava/lang/String;

.field public final zzXq:D

.field public final zzXr:D

.field public final zzXs:D


# direct methods
.method public constructor <init>(Ljava/lang/String;DDDI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsdark/google/android/gms/internal/zzpo$zza;->name:Ljava/lang/String;

    iput-wide p2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXr:D

    iput-wide p4, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXq:D

    iput-wide p6, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXs:D

    iput p8, p0, Lsdark/google/android/gms/internal/zzpo$zza;->count:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x0

    instance-of v1, p1, Lsdark/google/android/gms/internal/zzpo$zza;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    check-cast p1, Lsdark/google/android/gms/internal/zzpo$zza;

    iget-object v1, p0, Lsdark/google/android/gms/internal/zzpo$zza;->name:Ljava/lang/String;

    iget-object v2, p1, Lsdark/google/android/gms/internal/zzpo$zza;->name:Ljava/lang/String;

    invoke-static {v1, v2}, Lsdark/google/android/gms/common/internal/zzaa;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXq:D

    iget-wide v4, p1, Lsdark/google/android/gms/internal/zzpo$zza;->zzXq:D

    cmpl-double v1, v2, v4

    if-nez v1, :cond_0

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXr:D

    iget-wide v4, p1, Lsdark/google/android/gms/internal/zzpo$zza;->zzXr:D

    cmpl-double v1, v2, v4

    if-nez v1, :cond_0

    iget v1, p0, Lsdark/google/android/gms/internal/zzpo$zza;->count:I

    iget v2, p1, Lsdark/google/android/gms/internal/zzpo$zza;->count:I

    if-ne v1, v2, :cond_0

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXs:D

    iget-wide v4, p1, Lsdark/google/android/gms/internal/zzpo$zza;->zzXs:D

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->name:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXq:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXr:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXs:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->count:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lsdark/google/android/gms/common/internal/zzaa;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    invoke-static {p0}, Lsdark/google/android/gms/common/internal/zzaa;->zzv(Ljava/lang/Object;)Lsdark/google/android/gms/common/internal/zzaa$zza;

    move-result-object v0

    const-string v1, "name"

    iget-object v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lsdark/google/android/gms/common/internal/zzaa$zza;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lsdark/google/android/gms/common/internal/zzaa$zza;

    move-result-object v0

    const-string v1, "minBound"

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXr:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lsdark/google/android/gms/common/internal/zzaa$zza;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lsdark/google/android/gms/common/internal/zzaa$zza;

    move-result-object v0

    const-string v1, "maxBound"

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXq:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lsdark/google/android/gms/common/internal/zzaa$zza;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lsdark/google/android/gms/common/internal/zzaa$zza;

    move-result-object v0

    const-string v1, "percent"

    iget-wide v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->zzXs:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lsdark/google/android/gms/common/internal/zzaa$zza;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lsdark/google/android/gms/common/internal/zzaa$zza;

    move-result-object v0

    const-string v1, "count"

    iget v2, p0, Lsdark/google/android/gms/internal/zzpo$zza;->count:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lsdark/google/android/gms/common/internal/zzaa$zza;->zzg(Ljava/lang/String;Ljava/lang/Object;)Lsdark/google/android/gms/common/internal/zzaa$zza;

    move-result-object v0

    invoke-virtual {v0}, Lsdark/google/android/gms/common/internal/zzaa$zza;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
