package t;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BuildApk
        implements Runnable {
    private HandleCallback callback;
    private String apkPath;
    private String output;

    public BuildApk(String apkPath, String output, HandleCallback callback) {
        this.apkPath = apkPath;
        this.output = output;
        this.callback = callback;
    }

    public void buid() {
        try {
            String dirCurrent = System.getProperty("user.dir");
            ProcessBuilder builder = new ProcessBuilder(new String[]{"cmd.exe", "/c", "java -Xmx1024m -jar \"" + dirCurrent + "\\apktool.jar\" -f b \"" + this.apkPath + "\" -o \"" + this.output + "\""});

            System.out.println("java -Xmx1024m -jar \"" + dirCurrent + "\\apktool.jar\" -f b \"" + this.apkPath + "\" -o \"" + this.output + "\"");
            builder.redirectErrorStream(true);
            Process p = builder.start();
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
        this.callback.buildComplete();
    }

    public void run() {
        buid();
    }
}
