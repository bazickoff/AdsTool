package t;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClearFW
        implements Runnable {
    private HandleCallback callback;
    private String apkPath;
    private String output;

    public void clrfw() {
        try {
            String dirCurrent = System.getProperty("user.dir");
            ProcessBuilder builder = new ProcessBuilder(new String[]{"cmd.exe", "/c", "java -Xmx1024m -jar \"" + dirCurrent + "\\apktool.jar\" empty-framework-dir --force"});
            builder.redirectErrorStream(true);
            Process p = builder.start();
            System.out.println("Clearing framework");
            BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
            for (; ; ) {
                String line = r.readLine();
                if (line == null) {
                    break;
                }
                this.callback.showStatus(line);
                System.out.println(line);
            }
        } catch (IOException ex) {
            this.callback.buildFalse(ex.getMessage());
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
        this.callback.clrFwComplete();
    }

    public void run() {
        clrfw();
    }

    public void setCallback(HandleCallback paramHandleCallback) {
        this.callback = paramHandleCallback;
    }
}
