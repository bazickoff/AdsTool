package t;

import java.awt.Button;
import java.awt.Color;
import java.awt.Desktop;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.text.DefaultCaret;

import net.iharder.dnd.FileDrop;
import net.iharder.dnd.FileDrop.Listener;
import t.utils.FileUtils;

public class MainFrame extends JFrame implements HandleCallback {
    public static int countSmali = 2;
    private JButton btn_buildsign;
    private JButton btn_handle;
    private JButton btn_open_folder;
    private Button btn_select_file;
    static StringBuilder builder = new StringBuilder();
    public static JCheckBox cb_change_splash;
    public static JCheckBox cb_remain;

    private String dirApkFile = "";
    FileUtils fileUtils = new FileUtils();
    private boolean isHanlde = false;
    private JLabel jLabel1;
    private JLabel jLabel2;
    private JLabel jLabel3;
    private JLabel jLabel4;
    private JLabel jLabel5;
    private JLabel jLabel6;
    private JPanel jPanel1;
    private JScrollPane jScrollPane1;
    private MainThread mainThread;
    private String nameApk = "", isSplashChked = "";
    private final String pathFolderTools = System.getProperty("user.dir");
    public static JTextField tv_adID_2;
    public static JTextField tv_adID_1;
    private static JLabel tv_notify;
    private JTextField tv_path_file;
    private static JTextArea tv_status_cmd;
    private JTextField tv_credit;

    public MainFrame() {
        initComponents();
        setStatus("I: PMT Ads Tool v1.0.1 - Platinmods.com" +
                "\nI: Clear framework cache if you are having problem compiling APK" +
                "\n------------------------------------------" +
                "\nIMPORTANT: After you injeted the ads, make sure to test on all Android versions as" +
                "\npossible as you can since some games with ads doesn't work on some Android versions" +
                "\n(e.g Permission issues). If the APK having issues, don't release the APK mod with ads!" +
                "\nWe try hard to support all versions and apps/games but we can't fix unknown issues sadly");
        FileDrop fileDrop = new FileDrop(System.out, this.tv_path_file, new Listener() {
            public void filesDropped(File[] files) {
                try {
                    MainFrame.this.nameApk = files[0].getName().replace(".apk", "");
                    System.out.println("nameApk_" + MainFrame.this.nameApk);
                    MainFrame.this.dirApkFile = files[0].getParent().toString() + "\\" + MainFrame.this.nameApk;
                    System.out.println("dirApkFile" + MainFrame.this.dirApkFile);
                    MainFrame.this.tv_path_file.setText(files[0].getCanonicalPath());
                } catch (IOException ex) {
                    Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
        tv_credit.setText(this.fileUtils.getParam("userid"));
        tv_adID_1.setText(this.fileUtils.getParam("id1"));
        tv_adID_2.setText(this.fileUtils.getParam("id2"));
        isSplashChked = (this.fileUtils.getParam("splash"));
        try {
            if (isSplashChked.contains("true"))
                cb_change_splash.setSelected(true);
        } catch (Exception ex) {

        }
        System.out.println("re: " + pathFolderTools);
    }

    private void initComponents() {
        this.jPanel1 = new JPanel();
        this.jLabel1 = new JLabel();
        this.tv_path_file = new JTextField();
        this.btn_select_file = new Button();
        this.btn_handle = new JButton();
        this.btn_buildsign = new JButton();
        this.jScrollPane1 = new JScrollPane();
        this.tv_status_cmd = new JTextArea();
        this.tv_notify = new JLabel();
        this.tv_adID_1 = new JTextField();
        this.tv_adID_2 = new JTextField();
        this.jLabel2 = new JLabel();
        this.jLabel3 = new JLabel();
        this.btn_open_folder = new JButton();
        this.cb_change_splash = new JCheckBox();
        this.jLabel4 = new JLabel();
        this.tv_credit = new JTextField();
        this.cb_remain = new JCheckBox();
        this.jLabel5 = new JLabel();
        this.jLabel6 = new JLabel();

        setDefaultCloseOperation(3);
        setTitle("PMT Ads Tool v1.0.1");
        setBackground(new Color(255, 255, 255));
        setResizable(false);
        this.jPanel1.setBackground(new Color(255, 255, 255));
        this.jLabel1.setFont(new Font("Tahoma", 0, 14));
        this.jLabel1.setText("APK:");
        this.tv_path_file.setEditable(false);
        this.tv_path_file.setBackground(new Color(255, 255, 255));
        this.tv_path_file.setToolTipText("");
        this.btn_select_file.setActionCommand("btn_select_file");
        this.btn_select_file.setLabel("Select APK");
        this.btn_select_file.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent evt) {
                MainFrame.this.btn_select_fileMouseClicked(evt);
            }
        });
        this.btn_handle.setText("START");
        this.btn_handle.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent evt) {
                MainFrame.this.btn_handleMouseClicked(evt);
            }
        });
        this.btn_buildsign.setText("Clear framework cache");
        this.btn_buildsign.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent evt) {
                MainFrame.this.btn_buildsignMouseClicked(evt);
            }
        });
        this.jScrollPane1.setVerticalScrollBarPolicy(22);
        this.jScrollPane1.setAutoscrolls(true);
        this.tv_status_cmd.setEditable(false);
        this.tv_status_cmd.setBackground(new Color(0, 0, 0));
        this.tv_status_cmd.setColumns(20);
        this.tv_status_cmd.setForeground(new Color(255, 255, 255));
        this.tv_status_cmd.setRows(5);
        this.tv_status_cmd.setFont(new Font("Consolas", 0, 12));
        this.tv_status_cmd.setCaretColor(new Color(255, 255, 255));
        this.jScrollPane1.setViewportView(this.tv_status_cmd);
        this.tv_notify.setForeground(new Color(255, 0, 0));
        this.tv_notify.setHorizontalAlignment(0);
        this.tv_notify.setText("");
        this.tv_notify.setHorizontalTextPosition(0);
        this.jLabel2.setText("Ad ID (Interstitial only)");
        //this.jLabel3.setText("Ad ID #2 (Banner)");
        this.btn_open_folder.setText("Open Folder");
        this.btn_open_folder.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent evt) {
                MainFrame.this.btn_open_folderMouseClicked(evt);
            }
        });
        this.cb_change_splash.setText("Replace splash");
        this.jLabel4.setFont(new Font("Tahoma", 0, 14));
        this.jLabel4.setText("Credit:");
        this.tv_credit.setToolTipText("Enter your credit toast");
        this.cb_remain.setSelected(true);
        this.cb_remain.setText("Remember");
        this.jLabel5.setForeground(new Color(0, 153, 51));
        this.jLabel5.setText("Drag and drop APK or select APK file");
        this.jLabel6.setText("");
        this.jLabel6.setToolTipText("");

        GroupLayout jPanel1Layout = new GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING)
                .addGroup(jPanel1Layout.createSequentialGroup().addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING)
                                .addGroup(jPanel1Layout.createSequentialGroup().addGap(211, 211, 211).addComponent(this.jLabel5)
                                        .addGap(251, 251, 251)).addGroup(jPanel1Layout.createSequentialGroup()
                                        .addGroup(jPanel1Layout.createParallelGroup(Alignment.TRAILING)
                                                .addComponent(this.jLabel4) //Credit
                                                .addComponent(this.jLabel1)).addPreferredGap(ComponentPlacement.UNRELATED) //APK
                                        .addGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING, false)
                                                .addComponent(this.tv_path_file, -1, 480, 32767)
                                                .addComponent(this.tv_credit)).addPreferredGap(ComponentPlacement.RELATED, -1, 32767)
                                        .addGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING)
                                                .addComponent(this.btn_select_file, -2, 90, -2)
                                                .addComponent(this.cb_remain)).addContainerGap())))
                .addComponent(this.jScrollPane1).addGroup(jPanel1Layout.createSequentialGroup().addGap(29, 29, 29)
                        .addGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING)
                                .addGroup(jPanel1Layout.createParallelGroup(Alignment.TRAILING, false)
                                        .addGroup(Alignment.LEADING, jPanel1Layout.createSequentialGroup().addGap(89, 89, 89)
                                                .addComponent(this.tv_notify, -2, 349, -2).addGap(0, 115, 32767))
                                        .addGroup(jPanel1Layout.createSequentialGroup().addGap(18, 18, 18)
                                                .addComponent(this.btn_buildsign).addGap(89, 89, 89)
                                                .addComponent(this.btn_handle, -2, 134, -2).addGap(73, 73, 73)
                                                .addComponent(this.btn_open_folder)))
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING)
                                                .addGroup(jPanel1Layout.createSequentialGroup().addComponent(this.jLabel3).addGap(27, 27, 27))
                                                .addGroup(Alignment.TRAILING, jPanel1Layout.createSequentialGroup().addComponent(this.jLabel2).addGap(18, 18, 18)))
                                        .addGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup()
                                                .addComponent(this.cb_change_splash).addGap(26, 26, 26))
                                                .addGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING, false)
                                                        .addComponent(this.tv_adID_1, -1, 459, 32767)
                                                        .addComponent(this.tv_adID_2)))))
                        .addContainerGap(-1, 32767))
                .addGroup(Alignment.TRAILING, jPanel1Layout.createSequentialGroup().addContainerGap(-1, 32767)
                        .addComponent(this.jLabel6).addGap(191, 191, 191)));
        jPanel1Layout.setVerticalGroup(
                jPanel1Layout.createParallelGroup(Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup().addGap(8, 8, 8)
                                .addComponent(this.jLabel5).addPreferredGap(ComponentPlacement.RELATED)
                                .addGroup(jPanel1Layout.createParallelGroup(Alignment.LEADING)
                                        .addGroup(jPanel1Layout.createParallelGroup(Alignment.BASELINE)
                                                .addComponent(this.tv_path_file, -2, 34, -2) //1st textbox ID
                                                .addComponent(this.jLabel1)).addComponent(this.btn_select_file, Alignment.TRAILING, -2, 34, -2))
                                .addGap(18, 18, 18).addGroup(jPanel1Layout.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(this.tv_credit, -2, 34, -2).addComponent(this.jLabel4) //2nd textbox ID
                                        .addComponent(this.cb_remain)).addPreferredGap(ComponentPlacement.UNRELATED)
                                .addGroup(jPanel1Layout.createParallelGroup(Alignment.BASELINE).addComponent(this.btn_handle)
                                        .addComponent(this.btn_buildsign)
                                        .addComponent(this.btn_open_folder)).addGap(17, 17, 17)
                                .addComponent(this.tv_notify).addGap(11, 11, 11)
                                .addGroup(jPanel1Layout.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(this.cb_change_splash)).addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(this.tv_adID_1, -2, 28, -2)
                                        .addComponent(this.jLabel2)).addPreferredGap(ComponentPlacement.UNRELATED) //ID 1
                                .addGroup(jPanel1Layout.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(this.tv_adID_2, -2, 0, -2)
                                        .addComponent(this.jLabel3)).addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(this.jLabel6).addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(this.jScrollPane1, -2, 171, -2)));
        GroupLayout layout = new GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(Alignment.LEADING).addComponent(this.jPanel1, -1, -1, 32767));
        layout.setVerticalGroup(layout.createParallelGroup(Alignment.LEADING).addComponent(this.jPanel1, -1, -1, 32767));
        pack();
    }

    // ----- Open folder ----- //
    private void btn_open_folderMouseClicked(MouseEvent evt) {
        try {
            Desktop.getDesktop().open(new File(dirApkFile));
        } catch (IOException ex) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex);
            setStatus("E: " + ex.getMessage());
        }
    }

    // ----- Clear FW ----- //
    private void btn_buildsignMouseClicked(MouseEvent evt) {
        if (this.mainThread == null) {
            this.mainThread = new MainThread();
        }
        this.isHanlde = true;
        this.mainThread.addTask(new ClearFW());
        ClearFW clrfw = new ClearFW();
        clrfw.setCallback(this);
        setStatus("I: Clearing framework...");
        new Thread(clrfw).start();
    }

    // ----- START ----- //
    private void btn_handleMouseClicked(MouseEvent evt) {
        DefaultCaret caret = (DefaultCaret) tv_status_cmd.getCaret();
        caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
        System.out.println("start" + this.dirApkFile);
        this.builder.setLength(0);
        if (this.tv_credit.getText().length() == 0) {
            this.tv_notify.setText("Please input your credit...");
        } else if (this.tv_path_file.getText().length() <= 0 || this.isHanlde) {
            this.tv_notify.setText("Please select the APK file");
        } else {
            if (this.cb_remain.isSelected()) {
                this.fileUtils.save("userid", this.tv_credit.getText());
            }
            isHanlde = true;
            // btn
            btn_handle.setText("Processing...");
            setStatus("I: Processing...");
            btn_handle.setEnabled(false);
            btn_buildsign.setEnabled(false);
            btn_select_file.setEnabled(false);

            DecomplieApk apk = new DecomplieApk(this.tv_path_file.getText(), this.dirApkFile); //Decompile apk
            apk.setCallback(this);
            new Thread(apk).start();
        }
    }

    // ----- Select file ----- //
    private void btn_select_fileMouseClicked(MouseEvent evt) {
        JFileChooser fc = new JFileChooser();
        fc.setFileFilter(new FileNameExtensionFilter("apk file", new String[]{"apk"}));
        int rVal = fc.showOpenDialog(this);
        if (rVal == 0) {
            this.nameApk = fc.getSelectedFile().getName().replace(".apk", "");
            this.dirApkFile = fc.getCurrentDirectory().toString() + "\\" + this.nameApk;
            this.tv_path_file.setText(fc.getCurrentDirectory().toString() + "\\" + fc.getSelectedFile().getName());
        }
        if (rVal == 1) {
            this.tv_path_file.setText("");
        }
    }

    public static void main(String[] args) {
        try {
            for (LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex2) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex2);
        } catch (IllegalAccessException ex3) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex3);
        } catch (UnsupportedLookAndFeelException ex4) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex4);
        }
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainFrame().setVisible(true);
            }
        });
    }

    public void showStatus(String status) {
        setStatus(status);
    }

    // ----- Decompile complete ----- //
    public void decodeComplete() {
        System.out.println("I: Decompiled");
        setStatus("I: Decompiled");

        JTextArea textArea = new JTextArea();
        DefaultCaret caret = (DefaultCaret) textArea.getCaret();
        caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);

        // this.tv_notify.setText("Complete Decode -> Copying library...");
        this.mainThread = new MainThread();
        // Modify smali - tv_adID_1 fix crash. Change back to 2 if using banner ads
        this.mainThread.addTask(new ModifySmali(this.pathFolderTools, tv_adID_1.getText() + "@" + tv_adID_1.getText(), tv_credit.getText()));
        // Copy lib ads
        this.mainThread.addTask(new CopyLibAds(this.pathFolderTools, this.dirApkFile, this));

        // Change splash
        if (this.cb_change_splash.isSelected()) {
            this.mainThread.addTask(new ChangeSplash(new File(this.pathFolderTools + "\\splash.png"),
                    new File[]{new File(this.dirApkFile + "\\assets\\bin\\Data\\splash.png"),
                            new File(this.dirApkFile + "\\assets\\splash.png"),
                            new File(this.dirApkFile + "\\res\\raw\\\\splash.png")}));
            this.mainThread.addTask(new ChangeSplash(new File(this.pathFolderTools + "\\loading_logo.png"),
                    new File[]{new File(this.dirApkFile + "\\res\\drawable\\\\loading_logo.png")}));
        }

        // Change manifest
        this.mainThread.addTask(new ChangeManfei(this.dirApkFile, this.tv_credit.getText(), this));
    }

    // ----- Log/Status ----- //
    public static void setStatus(String content) {
        builder.append(content + "\n");
        tv_status_cmd.setText(builder.toString());
        //System.out.println(content);
        //tv_notify.setText(content);
    }

    public void startCopySmali() {
        setStatus("I: Copying lib folder...");
    }

    public void changeManfeErrorMutidex(String appclass) {
        setStatus("I: Editing AndroidManifest ->> error adding mutildex method inside" + appclass);
        this.mainThread.addTask(new ChangeApplication(this.dirApkFile + "\\smali\\" + appclass.replace(".", "\\") + ".smali", this));
    }

    public void changeManfeMutidexComplete() {
        setStatus("I: AndroidManifest edited -> Building");
        this.mainThread.addTask(new BuildApk(this.dirApkFile, this.dirApkFile + "_unsigned.apk", this));
    }

    //Compile complete
    public void buildComplete() {
        setStatus("I: Compiled -> Signing");
        this.mainThread.addTask(new SignerApk(this.dirApkFile + "_signed.apk", this.dirApkFile + "_unsigned.apk", this));
    }

    public void clrFwComplete() {
        setStatus("I: Framework cleared");
    }

    public void buildFalse(String msg) {
        setStatus("E: Application build failed -> check bug" + msg);
        this.isHanlde = false;
        this.btn_handle.setText("Process");
        this.btn_buildsign.setVisible(true);
    }

    public void signComplete() {
        setStatus("I: Sign completed");
        this.btn_handle.setText("START");
        this.btn_handle.setEnabled(true);
        btn_buildsign.setEnabled(true);
        btn_select_file.setEnabled(true);

        this.isHanlde = false;
        // this.tv_notify.setText("Successfully attached");
        this.btn_buildsign.setVisible(true);
    }

    //idpackage
    public void onResultIdPackate(String idpack) {
        //this.tv_idpackage.setText(idpack);
        setStatus("I: Checking and copying resources");
        System.out.println("patj " + this.pathFolderTools + "\\projectg\\" + idpack);
        if (new File(this.pathFolderTools + "\\projectg\\" + idpack).exists()) {
            this.mainThread.addTask(new CopyResource(this.pathFolderTools + "\\projectg\\" + idpack, this.dirApkFile, this));
        }
    }

    //idmain
    public void onResultIdMain(String idmain) {
        //this.tv_idmain.setText(idmain);
    }

    public void missStyleXML() {
        try {
            ChangeStyle changeStyle = new ChangeStyle();
            changeStyle.setCallback(this);
            changeStyle.haldleStyle(this.dirApkFile + "\\res\\values\\styles.xml");
        } catch (IOException ex) {
            Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeAppClassComplete() {
        setStatus("I: Added Mutildex successfully -> Compiling");
        this.mainThread.addTask(new BuildApk(this.dirApkFile, this.dirApkFile + "_signer.apk", this));
    }

    public void copyFolderLibsComplete() {
        setStatus("I: Libs folder copied successfully");
    }

    public void changeStyleComplete() {
    }
}