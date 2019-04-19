package t;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SignerApk
        implements Runnable {
    private HandleCallback callback;
    private String apkPath;
    private String output;

    public SignerApk(String paramString1, String paramString2, HandleCallback paramHandleCallback) {
        this.apkPath = paramString1;
        this.output = paramString2;
        this.callback = paramHandleCallback;
    }

    public void sign() {
        try {
            String str1 = System.getProperty("user.dir");
            ProcessBuilder localProcessBuilder = new ProcessBuilder(new String[]{"cmd.exe", "/c", "java -Xmx1024m -jar \"" + str1 + "\\apksigner.jar\" sign --ks \""
                    + str1 + "\\PMT.jks\" --ks-pass pass:platin --out \"" + this.apkPath + "\" \"" + this.output + "\""});

            System.out.println("java -Xmx1024m -jar \"" + str1 + "\\apksigner.jar\" --ks \"" + str1 + "\\PMT.jks\" --ks-pass pass: --out \"" + this.apkPath + "\" \"" + this.output + "\"");
            localProcessBuilder.redirectErrorStream(true);
            Process localProcess = localProcessBuilder.start();
            BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(localProcess.getInputStream()));
            for (; ; ) {
                String str2 = localBufferedReader.readLine();
                if (str2 == null) {
                    break;
                }
                this.callback.showStatus(str2);
                System.out.println(str2);
            }

            this.callback.signComplete();
        } catch (IOException localIOException) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, localIOException);
        }
    }

    public void zipaligt() {
        try {
            String str1 = System.getProperty("user.dir");
            ProcessBuilder localProcessBuilder = new ProcessBuilder(new String[]{"cmd.exe", "/c", "zipalign -f -v 4 " + this.apkPath + " " + this.apkPath});

            System.out.println("zipalign -f -v 4 " + this.apkPath + " " + this.apkPath);
            localProcessBuilder.redirectErrorStream(true);
            Process localProcess = localProcessBuilder.start();
            BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(localProcess.getInputStream()));
            for (; ; ) {
                String str2 = localBufferedReader.readLine();
                if (str2 == null) {
                    break;
                }
                this.callback.showStatus(str2);
                System.out.println(str2);
            }
        } catch (IOException localIOException) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, localIOException);
        }
    }

    public void run() {
        sign();
    }
}
