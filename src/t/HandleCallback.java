package t;

public abstract interface HandleCallback {
    public abstract void showStatus(String paramString);

    public abstract void decodeComplete();

    public abstract void onResultIdPackate(String paramString);

    public abstract void onResultIdMain(String paramString);

    public abstract void startCopySmali();

    public abstract void copyFolderLibsComplete();

    public abstract void missStyleXML();

    public abstract void changeManfeErrorMutidex(String paramString);

    public abstract void changeManfeMutidexComplete();

    public abstract void changeStyleComplete();

    public abstract void changeAppClassComplete();

    public abstract void buildComplete();

    public abstract void signComplete();

    public abstract void buildFalse(String paramString);

    public abstract void clrFwComplete();
}
