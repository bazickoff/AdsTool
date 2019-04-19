package t;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;

public class ChangeStyle {
    private ArrayList<String> lineContents;
    private HandleCallback callback;

    public void setCallback(HandleCallback callback) {
        this.callback = callback;
    }

    public void haldleStyle(String path) throws IOException {
        this.lineContents = new ArrayList();

        int countLine = 0;

        BufferedReader br = new BufferedReader(new FileReader(path));
        Throwable localThrowable4 = null;
        try {
            String line = br.readLine();
            while (line != null) {
                if (line.contains("Theme.TTIAPTheme")) {
                    return;
                }

                if (line.contains("</resources>")) {
                    this.lineContents.add("<style name=\"Theme.TTIAPTheme\" parent=\"@android:style/Theme\">");
                    this.lineContents.add("<item name=\"android:windowBackground\">@android:color/transparent</item>");
                    this.lineContents.add("<item name=\"android:windowNoTitle\">true</item>");
                    this.lineContents.add("<item name=\"android:windowIsFloating\">true</item>");
                    this.lineContents.add("<item name=\"android:windowIsTranslucent\">true</item>");
                    this.lineContents.add("<item name=\"android:windowContentOverlay\">@null</item>");
                    this.lineContents.add("<item name=\"android:backgroundDimEnabled\">false</item>");
                    this.lineContents.add("</style>");
                    this.lineContents.add(line);
                } else {
                    this.lineContents.add(line);
                }

                line = br.readLine();
                countLine++;
            }
            try {
                PrintWriter writer = new PrintWriter(path, "UTF-8");
                for (String content : this.lineContents) {
                    writer.println(content);
                }
                writer.close();
                this.callback.changeStyleComplete();
            } catch (IOException localIOException) {
            }
        } catch (Throwable localThrowable2) {
            localThrowable4 = localThrowable2;
            throw localThrowable2;
        } finally {
            if (br != null) if (localThrowable4 != null) try {
                br.close();
            } catch (Throwable localThrowable3) {
                localThrowable4.addSuppressed(localThrowable3);
            }
            else br.close();
        }
    }

    private static final AtomicInteger sNextGeneratedId = new AtomicInteger(1);
    private static final int sizeOfIntInHalfBytes = 8;

    public void addIdStyle(String path) throws IOException {
        this.lineContents = new ArrayList();

        int countLine = 0;
        String id = "";
        int idExtis = 0;
        BufferedReader br = new BufferedReader(new FileReader(path));
        Throwable localThrowable4 = null;
        try {
            String line = br.readLine();
            while (line != null) {
                if (line.contains("Theme.TTIAPTheme")) {
                    return;
                }

                if ((this.lineContents.size() > 2) &&
                        (line.contains(id))) {
                    if (idExtis > 0) {
                        idExtis += 10;
                    } else {
                        id = ((String) this.lineContents.get(2)).substring(((String) this.lineContents.get(2)).indexOf("id=\"") + 4);
                        id = id.substring(0, id.indexOf("\""));
                        idExtis = Integer.valueOf(id.substring(2), 16).intValue();
                        idExtis += 10;
                    }
                    id = decToHex(idExtis).toLowerCase();
                }

                if (line.contains("</resources>")) {
                    this.lineContents.add("<public type=\"style\" name=\"Theme.TTIAPTheme\" id=\"" + id + "\" />");
                    this.lineContents.add(line);
                } else {
                    this.lineContents.add(line);
                }
                line = br.readLine();
                countLine++;
            }
            try {
                PrintWriter writer = new PrintWriter(path, "UTF-8");
                for (String content : this.lineContents) {
                    writer.println(content);
                }
                writer.close();
            } catch (IOException localIOException) {
            }
        } catch (Throwable localThrowable2) {
            localThrowable4 = localThrowable2;
            throw localThrowable2;
        } finally {
            if (br != null) if (localThrowable4 != null) try {
                br.close();
            } catch (Throwable localThrowable3) {
                localThrowable4.addSuppressed(localThrowable3);
            }
            else br.close();
        }
    }

    private static final int numberOfBitsInAHalfByte = 4;
    private static final int halfByte = 15;
    private static final char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    public String decToHex(int dec) {
        StringBuilder hexBuilder = new StringBuilder(8);
        hexBuilder.setLength(8);
        for (int i = 7; i >= 0; i--) {
            int j = dec & 0xF;
            hexBuilder.setCharAt(i, hexDigits[j]);
            dec >>= 4;
        }
        return "0x" + hexBuilder.toString();
    }

    public int generateViewId() {
        for (; ; ) {
            int result = sNextGeneratedId.get();

            int newValue = result + 1;
            if (newValue > 16777215) {
                newValue = 1;
            }

            if (sNextGeneratedId.compareAndSet(result, newValue)) {
                return result;
            }
        }
    }
}
