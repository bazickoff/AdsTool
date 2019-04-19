package t.utils;

import t.MainFrame;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import static t.MainFrame.setStatus;

public class FileUtils {
    public static void copyDirectory(File sourceLocation, File targetLocation) throws IOException {
        if (sourceLocation.isDirectory()) {
            if (!targetLocation.exists()) {
                targetLocation.mkdirs();
            }

            String[] children = sourceLocation.list();
            for (int i = 0; i < children.length; i++) {
                copyDirectory(new File(sourceLocation, children[i]), new File(targetLocation, children[i]));
            }
        } else {
            InputStream in = new FileInputStream(sourceLocation);
            OutputStream out = new FileOutputStream(targetLocation);

            byte[] buf = new byte['?'];
            int len;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            in.close();
            out.close();
        }
    }

    public void save(String key, String value) {
        try {
            Properties prop = new Properties();
            prop.setProperty(key, value);
            prop.setProperty("id1", MainFrame.tv_adID_1.getText());
            // prop.setProperty("id2", MainFrame.tv_adID_2.getText());
            if (MainFrame.cb_change_splash.isSelected())
                prop.setProperty("splash", "true");
            prop.store(new FileOutputStream("file.properties"), null);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(FileUtils.class.getName()).log(Level.SEVERE, null, ex);
            setStatus("E: " + ex.getMessage());
        } catch (IOException ex) {
            Logger.getLogger(FileUtils.class.getName()).log(Level.SEVERE, null, ex);
            setStatus("E: " + ex.getMessage());
        }
    }

    public String getParam(String key) {
        String str = System.getProperty("user.dir");
        File f = new File(str + "//file.properties");
        if (f.exists()) {
            try {
                Properties prop = new Properties();
                prop.load(new FileInputStream("file.properties"));
                return prop.getProperty(key);
            } catch (FileNotFoundException ex) {
                Logger.getLogger(FileUtils.class.getName()).log(Level.SEVERE, null, ex);
                setStatus("E: " + ex.getMessage());
            } catch (IOException ex) {
                Logger.getLogger(FileUtils.class.getName()).log(Level.SEVERE, null, ex);
                setStatus("E: " + ex.getMessage());
            }

        }
        return "";
    }
}
