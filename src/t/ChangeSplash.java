package t;

import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;

import t.utils.FileUtils;

public class ChangeSplash implements Runnable {
    private File sourceLocation;
    private File[] targetLocation;

    public ChangeSplash(File sourceLocation, File[] targetLocation) {
        this.sourceLocation = sourceLocation;
        this.targetLocation = targetLocation;
    }

    public void run() {
        try {
            for (File file : this.targetLocation) {
                if (file.exists()) {
                    FileUtils.copyDirectory(this.sourceLocation, file);
                    return;
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(FileUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}