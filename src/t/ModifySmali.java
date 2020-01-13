package t;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

import static t.MainFrame.setStatus;

class ModifySmali
        implements Runnable {
    private ArrayList<String> lineContents;
    private HandleCallback callback;
    private String pathFolderTool, AdID, Credit;

    public ModifySmali(String pathTool, String adID, String credit) {
        pathFolderTool = pathTool;
        AdID = adID;
        Credit = credit;
    }

    public void haldleAppClass(String path, String str, int lines, boolean shouldEnc) throws IOException {
        System.out.println("re: " + path);
        if (!new File(path).exists()) return;
        this.lineContents = new ArrayList();

        int countLine = 0;

        BufferedReader br = new BufferedReader(new FileReader(path));
        Throwable localThrowable3 = null;
        try {
            String line = br.readLine();
            boolean firtEndMethod = false;
            while (line != null) {
                if (countLine == lines) {
                    //Change ID
                    if (shouldEnc) {
                        byte[] message = str.getBytes(StandardCharsets.UTF_8);
                        String encoded = Base64.getEncoder().encodeToString(message);
                        this.lineContents.add("    const-string v0, \"" + encoded + "\"");
                    } else
                        this.lineContents.add("    const-string v0, \"" + str + "\"");
                } else
                    this.lineContents.add(line);
                line = br.readLine();
                countLine++;
            }
            try {
                //System.out.println(line);
                PrintWriter writer = new PrintWriter(path, "UTF-8");
                for (String content : this.lineContents) {
                    writer.println(content);
                }
                writer.close();
            } catch (IOException ex) {
                Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex);
                setStatus("E: " + ex.getMessage());
            }
        } catch (Throwable localThrowable1) {
            localThrowable3 = localThrowable1;
            throw localThrowable1;
        } finally {
            if (br != null) if (localThrowable3 != null) try {
                br.close();
            } catch (Throwable localThrowable2) {
                localThrowable3.addSuppressed(localThrowable2);
            }
            else br.close();
        }
    }

    public void run() {
        try {
            haldleAppClass(this.pathFolderTool + "\\LibAds\\smali_classes2\\info\\mtad\\a\\a.smali", AdID, 62, true);
            haldleAppClass(this.pathFolderTool + "\\LibAds\\smali_classes2\\info\\mtad\\MTFullActivity.smali", Credit, 855, true);
            haldleAppClass(this.pathFolderTool + "\\LibAds\\smali_classes2\\info\\mtad\\MTFullActivity$1.smali",Credit, 61, true); //force
           // haldleAppClass(this.pathFolderTool + "\\LibAds\\smali_classes2\\info\\mtad\\MTFullActivity$1.smali", gotStr2, 61, true); //force
            haldleAppClass(this.pathFolderTool + "\\LibAds\\info1\\mtad\\a\\a.smali", AdID, 62, true);
            haldleAppClass(this.pathFolderTool + "\\LibAds\\info1\\mtad\\MTFullActivity.smali", Credit, 714, true);
            haldleAppClass(this.pathFolderTool + "\\LibAds\\info1\\mtad\\MTFullActivity$1.smali", Credit, 61, true);
           // haldleAppClass(this.pathFolderTool + "\\LibAds\\info1\\mtad\\MTFullActivity$1.smali", "UGxhdGlubW9kcy5jb20gLSBUaGUgZ2FtaW5nIGNvbW11bml0eQ==", 61, false);
           // haldleAppClass(this.pathFolderTool + "\\LibAds\\info1\\mtad\\MTFullActivity$1.smali", gotStr2, 61, true);
        } catch (IOException ex) {
            Logger.getLogger(ModifySmali.class.getName()).log(Level.SEVERE, null, ex);
            setStatus("E: " + ex.getMessage());
        }
    }
}
