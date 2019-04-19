package t;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import t.utils.FileUtils;

public class CopyResource
        implements Runnable {
    private String pathFolderTools;
    private String foldergame;
    HandleCallback callback;
    int i = 2;
    private String pathNew = "";

    public CopyResource(String pathFolderTools, String foldergame, HandleCallback callback) {
        this.pathFolderTools = pathFolderTools;
        this.foldergame = foldergame;
        this.callback = callback;
    }

    public void copySmali(File resource) {
        try {
            FileUtils.copyDirectory(resource, new File(this.foldergame));
        } catch (IOException ex) {
            Logger.getLogger(CopyResource.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void run() {
        copySmali(new File(this.pathFolderTools));
        this.callback.copyFolderLibsComplete();
    }
}
