package t;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.logging.Level;
import java.util.logging.Logger;

class DecomplieApk implements Runnable {
    private HandleCallback callback;
    private String apkPath;
    private String output;

    public DecomplieApk(String paramString1, String paramString2) {
        this.apkPath = paramString1;
        this.output = paramString2;
    }

    public void setCallback(HandleCallback paramHandleCallback) {
        this.callback = paramHandleCallback;
    }

    public void decode() {
        try {
            String str1 = System.getProperty("user.dir");
            ProcessBuilder localProcessBuilder = new ProcessBuilder(new String[]{"cmd.exe", "/c", "java -Xmx1024m -jar \"" + str1 + "/apktool.jar\" -f d \"" + this.apkPath + "\" -o \"" + this.output + "\""});
            System.out.println("\"" + str1 + "\\apktool.jar\" d \"" + this.apkPath + "\"");
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

            this.callback.decodeComplete();
        } catch (IOException localIOException) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, localIOException);
        }
    }

    public void run() {
        decode();
    }
}
