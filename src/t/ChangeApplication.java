package t;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ChangeApplication
        implements Runnable {
    private ArrayList<String> lineContents;
    HandleCallback callback;
    String path;

    public ChangeApplication(String path, HandleCallback callback) {
        this.path = path;
        this.callback = callback;
    }

    public void haldleAppClass()
            throws IOException {
        this.lineContents = new ArrayList();

        int countLine = 0;

        BufferedReader br = new BufferedReader(new FileReader(this.path));
        Throwable localThrowable3 = null;
        try {
            String line = br.readLine();
            boolean firtEndMethod = false;
            while (line != null) {
                this.lineContents.add(line);
                if (line.contains("Landroid/app/Application;->attachBaseContext")) {
                    this.lineContents.add("invoke-static {p0}, Landroid/support/multidex/MultiDex;->install(Landroid/content/Context;)V");
                    firtEndMethod = true;
                }

                line = br.readLine();
                countLine++;
            }
            if (!firtEndMethod) {
                this.lineContents.add("   ");
                this.lineContents.add(".method protected attachBaseContext(Landroid/content/Context;)V");
                this.lineContents.add(".locals 0");
                this.lineContents.add("   ");
                this.lineContents.add(".prologue");
                this.lineContents.add("invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V");
                this.lineContents.add("invoke-static {p0}, Landroid/support/multidex/MultiDex;->install(Landroid/content/Context;)V");
                this.lineContents.add("   ");
                this.lineContents.add("return-void");
                this.lineContents.add(".end method");
            }
            try {
                PrintWriter writer = new PrintWriter(this.path, "UTF-8");
                for (String content : this.lineContents) {
                    writer.println(content);
                }
                writer.close();
                this.callback.changeAppClassComplete();
            } catch (IOException ex) {
                Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex);
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
            haldleAppClass();
        } catch (IOException ex) {
            Logger.getLogger(ChangeApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
