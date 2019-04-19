package t;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import t.utils.FileUtils;

import static t.MainFrame.setStatus;

public class CopyLibAds
        implements Runnable {
    private String pathFolderTools;
    private String dirApkFile;
    HandleCallback callback;
    int i = 2;
    private String pathNew = "";

    public CopyLibAds(String pathFolderTools, String dirApkFile, HandleCallback callback) {
        this.pathFolderTools = pathFolderTools;
        this.dirApkFile = dirApkFile;
        this.callback = callback;
        this.callback.startCopySmali();
    }

    public void copyMutilDex(File resource, File target) {
        try {
            if (!target.exists()) {
                target.mkdirs();
            }

            FileUtils.copyDirectory(resource, new File(target.getAbsolutePath() + "\\multidex"));
        } catch (IOException ex) {
            Logger.getLogger(FileUtils.class.getName()).log(Level.SEVERE, null, ex);
            setStatus("E: " + ex.getMessage());
        }
    }

    public void copySmali(File resource) {
        try {
            createSmali(new File(this.dirApkFile));
            FileUtils.copyDirectory(resource, new File(this.pathNew));
        } catch (IOException ex) {
            Logger.getLogger(CopyLibAds.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void run() {
        copyMutilDex(new File(this.pathFolderTools + "\\LibAds\\multidex"), new File(this.dirApkFile + "\\smali\\android\\support"));
        copySmali(new File(this.pathFolderTools + "\\LibAds\\smali_classes2"));
        this.callback.copyFolderLibsComplete();
    }

    void createSmali(File targetLocation) {
        this.pathNew = (targetLocation.getAbsolutePath() + "\\smali_classes" + this.i);
        File smali = new File(this.pathNew);
        if (smali.isDirectory()) {
            this.i += 1;
            createSmali(targetLocation);
        } else {
            smali.mkdir();
            MainFrame.countSmali = this.i;
        }
    }
}
