require "spec_helper"

describe Facter::Util::Fact do
  before {
    Facter.clear
    Facter.fact(:kernel).stubs(:value).returns('Linux')
  }

  describe "java_libjvm" do
    context 'returns libjvm path' do
      context 'on osfamily RedHat' do
        before {
          Facter.fact(:osfamily).stubs(:value).returns('RedHat')
          Facter.fact(:java_path).stubs(:value).returns('/usr/java/jre1.8.0_45/bin/java')
        }
        context 'without java' do
          before {
            Facter.fact(:java_path).stubs(:value).returns(nil)
          }
          it do
            Facter::Util::Resolution.stubs(:exec)
            Facter.value(:java_libjvm).should be_nil
          end
        end
        context 'with rpm' do
          it do
            rpm_output = <<-EOS
/usr
/usr/java
/usr/java/jre1.8.0_45
/usr/java/jre1.8.0_45/.java
/usr/java/jre1.8.0_45/.java/.systemPrefs
/usr/java/jre1.8.0_45/.java/.systemPrefs/.system.lock
/usr/java/jre1.8.0_45/.java/.systemPrefs/.systemRootModFile
/usr/java/jre1.8.0_45/.java/init.d/jexec
/usr/java/jre1.8.0_45/COPYRIGHT
/usr/java/jre1.8.0_45/LICENSE
/usr/java/jre1.8.0_45/README
/usr/java/jre1.8.0_45/THIRDPARTYLICENSEREADME-JAVAFX.txt
/usr/java/jre1.8.0_45/THIRDPARTYLICENSEREADME.txt
/usr/java/jre1.8.0_45/Welcome.html
/usr/java/jre1.8.0_45/bin
/usr/java/jre1.8.0_45/bin/ControlPanel
/usr/java/jre1.8.0_45/bin/java
/usr/java/jre1.8.0_45/bin/javaws
/usr/java/jre1.8.0_45/bin/jcontrol
/usr/java/jre1.8.0_45/bin/jjs
/usr/java/jre1.8.0_45/bin/keytool
/usr/java/jre1.8.0_45/bin/orbd
/usr/java/jre1.8.0_45/bin/pack200
/usr/java/jre1.8.0_45/bin/policytool
/usr/java/jre1.8.0_45/bin/rmid
/usr/java/jre1.8.0_45/bin/rmiregistry
/usr/java/jre1.8.0_45/bin/servertool
/usr/java/jre1.8.0_45/bin/tnameserv
/usr/java/jre1.8.0_45/bin/unpack200
/usr/java/jre1.8.0_45/lib
/usr/java/jre1.8.0_45/lib/amd64
/usr/java/jre1.8.0_45/lib/amd64/jli
/usr/java/jre1.8.0_45/lib/amd64/jli/libjli.so
/usr/java/jre1.8.0_45/lib/amd64/jvm.cfg
/usr/java/jre1.8.0_45/lib/amd64/libavplugin-53.so
/usr/java/jre1.8.0_45/lib/amd64/libavplugin-54.so
/usr/java/jre1.8.0_45/lib/amd64/libawt.so
/usr/java/jre1.8.0_45/lib/amd64/libawt_headless.so
/usr/java/jre1.8.0_45/lib/amd64/libawt_xawt.so
/usr/java/jre1.8.0_45/lib/amd64/libbci.so
/usr/java/jre1.8.0_45/lib/amd64/libdcpr.so
/usr/java/jre1.8.0_45/lib/amd64/libdecora_sse.so
/usr/java/jre1.8.0_45/lib/amd64/libdeploy.so
/usr/java/jre1.8.0_45/lib/amd64/libdt_socket.so
/usr/java/jre1.8.0_45/lib/amd64/libfontmanager.so
/usr/java/jre1.8.0_45/lib/amd64/libfxplugins.so
/usr/java/jre1.8.0_45/lib/amd64/libglass.so
/usr/java/jre1.8.0_45/lib/amd64/libgstreamer-lite.so
/usr/java/jre1.8.0_45/lib/amd64/libhprof.so
/usr/java/jre1.8.0_45/lib/amd64/libinstrument.so
/usr/java/jre1.8.0_45/lib/amd64/libj2gss.so
/usr/java/jre1.8.0_45/lib/amd64/libj2pcsc.so
/usr/java/jre1.8.0_45/lib/amd64/libj2pkcs11.so
/usr/java/jre1.8.0_45/lib/amd64/libjaas_unix.so
/usr/java/jre1.8.0_45/lib/amd64/libjava.so
/usr/java/jre1.8.0_45/lib/amd64/libjava_crw_demo.so
/usr/java/jre1.8.0_45/lib/amd64/libjavafx_font.so
/usr/java/jre1.8.0_45/lib/amd64/libjavafx_font_freetype.so
/usr/java/jre1.8.0_45/lib/amd64/libjavafx_font_pango.so
/usr/java/jre1.8.0_45/lib/amd64/libjavafx_font_t2k.so
/usr/java/jre1.8.0_45/lib/amd64/libjavafx_iio.so
/usr/java/jre1.8.0_45/lib/amd64/libjawt.so
/usr/java/jre1.8.0_45/lib/amd64/libjdwp.so
/usr/java/jre1.8.0_45/lib/amd64/libjfr.so
/usr/java/jre1.8.0_45/lib/amd64/libjfxmedia.so
/usr/java/jre1.8.0_45/lib/amd64/libjfxwebkit.so
/usr/java/jre1.8.0_45/lib/amd64/libjpeg.so
/usr/java/jre1.8.0_45/lib/amd64/libjsdt.so
/usr/java/jre1.8.0_45/lib/amd64/libjsig.so
/usr/java/jre1.8.0_45/lib/amd64/libjsound.so
/usr/java/jre1.8.0_45/lib/amd64/libjsoundalsa.so
/usr/java/jre1.8.0_45/lib/amd64/libkcms.so
/usr/java/jre1.8.0_45/lib/amd64/liblcms.so
/usr/java/jre1.8.0_45/lib/amd64/libmanagement.so
/usr/java/jre1.8.0_45/lib/amd64/libmlib_image.so
/usr/java/jre1.8.0_45/lib/amd64/libnet.so
/usr/java/jre1.8.0_45/lib/amd64/libnio.so
/usr/java/jre1.8.0_45/lib/amd64/libnpjp2.so
/usr/java/jre1.8.0_45/lib/amd64/libnpt.so
/usr/java/jre1.8.0_45/lib/amd64/libprism_common.so
/usr/java/jre1.8.0_45/lib/amd64/libprism_es2.so
/usr/java/jre1.8.0_45/lib/amd64/libprism_sw.so
/usr/java/jre1.8.0_45/lib/amd64/libresource.so
/usr/java/jre1.8.0_45/lib/amd64/libsctp.so
/usr/java/jre1.8.0_45/lib/amd64/libsplashscreen.so
/usr/java/jre1.8.0_45/lib/amd64/libsunec.so
/usr/java/jre1.8.0_45/lib/amd64/libt2k.so
/usr/java/jre1.8.0_45/lib/amd64/libunpack.so
/usr/java/jre1.8.0_45/lib/amd64/libverify.so
/usr/java/jre1.8.0_45/lib/amd64/libzip.so
/usr/java/jre1.8.0_45/lib/amd64/server
/usr/java/jre1.8.0_45/lib/amd64/server/Xusage.txt
/usr/java/jre1.8.0_45/lib/amd64/server/libjsig.so
/usr/java/jre1.8.0_45/lib/amd64/server/libjvm.so
/usr/java/jre1.8.0_45/lib/applet
/usr/java/jre1.8.0_45/lib/calendars.properties
/usr/java/jre1.8.0_45/lib/charsets.jar
/usr/java/jre1.8.0_45/lib/charsets.pack
/usr/java/jre1.8.0_45/lib/classlist
/usr/java/jre1.8.0_45/lib/cmm
/usr/java/jre1.8.0_45/lib/cmm/CIEXYZ.pf
/usr/java/jre1.8.0_45/lib/cmm/GRAY.pf
/usr/java/jre1.8.0_45/lib/cmm/LINEAR_RGB.pf
/usr/java/jre1.8.0_45/lib/cmm/PYCC.pf
/usr/java/jre1.8.0_45/lib/cmm/sRGB.pf
/usr/java/jre1.8.0_45/lib/content-types.properties
/usr/java/jre1.8.0_45/lib/currency.data
/usr/java/jre1.8.0_45/lib/deploy
/usr/java/jre1.8.0_45/lib/deploy.jar
/usr/java/jre1.8.0_45/lib/deploy.pack
/usr/java/jre1.8.0_45/lib/deploy/MixedCodeMainDialog.ui
/usr/java/jre1.8.0_45/lib/deploy/MixedCodeMainDialogJs.ui
/usr/java/jre1.8.0_45/lib/deploy/cautionshield.icns
/usr/java/jre1.8.0_45/lib/deploy/ffjcext.zip
/usr/java/jre1.8.0_45/lib/deploy/java-icon.ico
/usr/java/jre1.8.0_45/lib/deploy/messages.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_de.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_es.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_fr.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_it.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_ja.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_ko.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_pt_BR.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_sv.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_zh_CN.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_zh_HK.properties
/usr/java/jre1.8.0_45/lib/deploy/messages_zh_TW.properties
/usr/java/jre1.8.0_45/lib/deploy/mixcode_s.png
/usr/java/jre1.8.0_45/lib/deploy/splash.gif
/usr/java/jre1.8.0_45/lib/deploy/splash@2x.gif
/usr/java/jre1.8.0_45/lib/desktop
/usr/java/jre1.8.0_45/lib/desktop/applications
/usr/java/jre1.8.0_45/lib/desktop/applications/sun-java.desktop
/usr/java/jre1.8.0_45/lib/desktop/applications/sun-javaws.desktop
/usr/java/jre1.8.0_45/lib/desktop/applications/sun_java.desktop
/usr/java/jre1.8.0_45/lib/desktop/icons
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16/apps
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16/apps/sun-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16/apps/sun-javaws.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16/apps/sun-jcontrol.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16/mimetypes
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16/mimetypes/gnome-mime-application-x-java-archive.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16/mimetypes/gnome-mime-application-x-java-jnlp-file.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/16x16/mimetypes/gnome-mime-text-x-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48/apps
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48/apps/sun-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48/apps/sun-javaws.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48/apps/sun-jcontrol.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48/mimetypes
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48/mimetypes/gnome-mime-application-x-java-archive.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48/mimetypes/gnome-mime-application-x-java-jnlp-file.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrast/48x48/mimetypes/gnome-mime-text-x-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16/apps
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16/apps/sun-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16/apps/sun-javaws.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16/apps/sun-jcontrol.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16/mimetypes
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16/mimetypes/gnome-mime-application-x-java-archive.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16/mimetypes/gnome-mime-application-x-java-jnlp-file.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/16x16/mimetypes/gnome-mime-text-x-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48/apps
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48/apps/sun-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48/apps/sun-javaws.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48/apps/sun-jcontrol.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48/mimetypes
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48/mimetypes/gnome-mime-application-x-java-archive.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48/mimetypes/gnome-mime-application-x-java-jnlp-file.png
/usr/java/jre1.8.0_45/lib/desktop/icons/HighContrastInverse/48x48/mimetypes/gnome-mime-text-x-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16/apps
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16/apps/sun-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16/apps/sun-javaws.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16/apps/sun-jcontrol.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16/mimetypes
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16/mimetypes/gnome-mime-application-x-java-archive.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16/mimetypes/gnome-mime-application-x-java-jnlp-file.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/16x16/mimetypes/gnome-mime-text-x-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48/apps
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48/apps/sun-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48/apps/sun-javaws.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48/apps/sun-jcontrol.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48/mimetypes
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48/mimetypes/gnome-mime-application-x-java-archive.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48/mimetypes/gnome-mime-application-x-java-jnlp-file.png
/usr/java/jre1.8.0_45/lib/desktop/icons/LowContrast/48x48/mimetypes/gnome-mime-text-x-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16/apps
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16/apps/sun-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16/apps/sun-javaws.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16/apps/sun-jcontrol.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16/mimetypes
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16/mimetypes/gnome-mime-application-x-java-archive.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16/mimetypes/gnome-mime-application-x-java-jnlp-file.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/16x16/mimetypes/gnome-mime-text-x-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48/apps
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48/apps/sun-java.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48/apps/sun-javaws.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48/apps/sun-jcontrol.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48/mimetypes
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48/mimetypes/gnome-mime-application-x-java-archive.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48/mimetypes/gnome-mime-application-x-java-jnlp-file.png
/usr/java/jre1.8.0_45/lib/desktop/icons/hicolor/48x48/mimetypes/gnome-mime-text-x-java.png
/usr/java/jre1.8.0_45/lib/desktop/mime
/usr/java/jre1.8.0_45/lib/desktop/mime/packages
/usr/java/jre1.8.0_45/lib/desktop/mime/packages/x-java-archive.xml
/usr/java/jre1.8.0_45/lib/desktop/mime/packages/x-java-jnlp-file.xml
/usr/java/jre1.8.0_45/lib/ext
/usr/java/jre1.8.0_45/lib/ext/cldrdata.jar
/usr/java/jre1.8.0_45/lib/ext/dnsns.jar
/usr/java/jre1.8.0_45/lib/ext/jfxrt.jar
/usr/java/jre1.8.0_45/lib/ext/jfxrt.pack
/usr/java/jre1.8.0_45/lib/ext/localedata.jar
/usr/java/jre1.8.0_45/lib/ext/localedata.pack
/usr/java/jre1.8.0_45/lib/ext/meta-index
/usr/java/jre1.8.0_45/lib/ext/nashorn.jar
/usr/java/jre1.8.0_45/lib/ext/sunec.jar
/usr/java/jre1.8.0_45/lib/ext/sunjce_provider.jar
/usr/java/jre1.8.0_45/lib/ext/sunpkcs11.jar
/usr/java/jre1.8.0_45/lib/ext/zipfs.jar
/usr/java/jre1.8.0_45/lib/flavormap.properties
/usr/java/jre1.8.0_45/lib/fontconfig.RedHat.5.bfc
/usr/java/jre1.8.0_45/lib/fontconfig.RedHat.5.properties.src
/usr/java/jre1.8.0_45/lib/fontconfig.RedHat.6.bfc
/usr/java/jre1.8.0_45/lib/fontconfig.RedHat.6.properties.src
/usr/java/jre1.8.0_45/lib/fontconfig.SuSE.10.bfc
/usr/java/jre1.8.0_45/lib/fontconfig.SuSE.10.properties.src
/usr/java/jre1.8.0_45/lib/fontconfig.SuSE.11.bfc
/usr/java/jre1.8.0_45/lib/fontconfig.SuSE.11.properties.src
/usr/java/jre1.8.0_45/lib/fontconfig.Turbo.bfc
/usr/java/jre1.8.0_45/lib/fontconfig.Turbo.properties.src
/usr/java/jre1.8.0_45/lib/fontconfig.bfc
/usr/java/jre1.8.0_45/lib/fontconfig.properties.src
/usr/java/jre1.8.0_45/lib/fonts
/usr/java/jre1.8.0_45/lib/fonts/LucidaBrightDemiBold.ttf
/usr/java/jre1.8.0_45/lib/fonts/LucidaBrightDemiItalic.ttf
/usr/java/jre1.8.0_45/lib/fonts/LucidaBrightItalic.ttf
/usr/java/jre1.8.0_45/lib/fonts/LucidaBrightRegular.ttf
/usr/java/jre1.8.0_45/lib/fonts/LucidaSansDemiBold.ttf
/usr/java/jre1.8.0_45/lib/fonts/LucidaSansRegular.ttf
/usr/java/jre1.8.0_45/lib/fonts/LucidaTypewriterBold.ttf
/usr/java/jre1.8.0_45/lib/fonts/LucidaTypewriterRegular.ttf
/usr/java/jre1.8.0_45/lib/fonts/fonts.dir
/usr/java/jre1.8.0_45/lib/hijrah-config-umalqura.properties
/usr/java/jre1.8.0_45/lib/images
/usr/java/jre1.8.0_45/lib/images/cursors
/usr/java/jre1.8.0_45/lib/images/cursors/cursors.properties
/usr/java/jre1.8.0_45/lib/images/cursors/invalid32x32.gif
/usr/java/jre1.8.0_45/lib/images/cursors/motif_CopyDrop32x32.gif
/usr/java/jre1.8.0_45/lib/images/cursors/motif_CopyNoDrop32x32.gif
/usr/java/jre1.8.0_45/lib/images/cursors/motif_LinkDrop32x32.gif
/usr/java/jre1.8.0_45/lib/images/cursors/motif_LinkNoDrop32x32.gif
/usr/java/jre1.8.0_45/lib/images/cursors/motif_MoveDrop32x32.gif
/usr/java/jre1.8.0_45/lib/images/cursors/motif_MoveNoDrop32x32.gif
/usr/java/jre1.8.0_45/lib/images/icons
/usr/java/jre1.8.0_45/lib/images/icons/sun-java.png
/usr/java/jre1.8.0_45/lib/images/icons/sun-java_HighContrast.png
/usr/java/jre1.8.0_45/lib/images/icons/sun-java_HighContrastInverse.png
/usr/java/jre1.8.0_45/lib/images/icons/sun-java_LowContrast.png
/usr/java/jre1.8.0_45/lib/install.jar
/usr/java/jre1.8.0_45/lib/javafx.properties
/usr/java/jre1.8.0_45/lib/javasettings
/usr/java/jre1.8.0_45/lib/javaws.jar
/usr/java/jre1.8.0_45/lib/javaws.pack
/usr/java/jre1.8.0_45/lib/jce.jar
/usr/java/jre1.8.0_45/lib/jexec
/usr/java/jre1.8.0_45/lib/jfr
/usr/java/jre1.8.0_45/lib/jfr.jar
/usr/java/jre1.8.0_45/lib/jfr/default.jfc
/usr/java/jre1.8.0_45/lib/jfr/profile.jfc
/usr/java/jre1.8.0_45/lib/jfxswt.jar
/usr/java/jre1.8.0_45/lib/jsse.jar
/usr/java/jre1.8.0_45/lib/jsse.pack
/usr/java/jre1.8.0_45/lib/jvm.hprof.txt
/usr/java/jre1.8.0_45/lib/locale
/usr/java/jre1.8.0_45/lib/locale/de
/usr/java/jre1.8.0_45/lib/locale/de/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/de/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/es
/usr/java/jre1.8.0_45/lib/locale/es/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/es/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/fr
/usr/java/jre1.8.0_45/lib/locale/fr/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/fr/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/it
/usr/java/jre1.8.0_45/lib/locale/it/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/it/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/ja
/usr/java/jre1.8.0_45/lib/locale/ja/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/ja/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/ko
/usr/java/jre1.8.0_45/lib/locale/ko.UTF-8
/usr/java/jre1.8.0_45/lib/locale/ko.UTF-8/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/ko.UTF-8/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/ko/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/ko/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/pt_BR
/usr/java/jre1.8.0_45/lib/locale/pt_BR/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/pt_BR/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/sv
/usr/java/jre1.8.0_45/lib/locale/sv/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/sv/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/zh
/usr/java/jre1.8.0_45/lib/locale/zh.GBK
/usr/java/jre1.8.0_45/lib/locale/zh.GBK/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/zh.GBK/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/zh/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/zh/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/zh_HK.BIG5HK
/usr/java/jre1.8.0_45/lib/locale/zh_HK.BIG5HK/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/zh_HK.BIG5HK/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/zh_TW
/usr/java/jre1.8.0_45/lib/locale/zh_TW.BIG5
/usr/java/jre1.8.0_45/lib/locale/zh_TW.BIG5/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/zh_TW.BIG5/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/locale/zh_TW/LC_MESSAGES
/usr/java/jre1.8.0_45/lib/locale/zh_TW/LC_MESSAGES/sunw_java_plugin.mo
/usr/java/jre1.8.0_45/lib/logging.properties
/usr/java/jre1.8.0_45/lib/management
/usr/java/jre1.8.0_45/lib/management-agent.jar
/usr/java/jre1.8.0_45/lib/management/jmxremote.access
/usr/java/jre1.8.0_45/lib/management/jmxremote.password.template
/usr/java/jre1.8.0_45/lib/management/management.properties
/usr/java/jre1.8.0_45/lib/management/snmp.acl.template
/usr/java/jre1.8.0_45/lib/meta-index
/usr/java/jre1.8.0_45/lib/net.properties
/usr/java/jre1.8.0_45/lib/oblique-fonts
/usr/java/jre1.8.0_45/lib/oblique-fonts/LucidaSansDemiOblique.ttf
/usr/java/jre1.8.0_45/lib/oblique-fonts/LucidaSansOblique.ttf
/usr/java/jre1.8.0_45/lib/oblique-fonts/LucidaTypewriterBoldOblique.ttf
/usr/java/jre1.8.0_45/lib/oblique-fonts/LucidaTypewriterOblique.ttf
/usr/java/jre1.8.0_45/lib/oblique-fonts/fonts.dir
/usr/java/jre1.8.0_45/lib/plugin.jar
/usr/java/jre1.8.0_45/lib/plugin.pack
/usr/java/jre1.8.0_45/lib/psfont.properties.ja
/usr/java/jre1.8.0_45/lib/psfontj2d.properties
/usr/java/jre1.8.0_45/lib/resources.jar
/usr/java/jre1.8.0_45/lib/rt.jar
/usr/java/jre1.8.0_45/lib/rt.pack
/usr/java/jre1.8.0_45/lib/security
/usr/java/jre1.8.0_45/lib/security/US_export_policy.jar
/usr/java/jre1.8.0_45/lib/security/blacklist
/usr/java/jre1.8.0_45/lib/security/blacklisted.certs
/usr/java/jre1.8.0_45/lib/security/cacerts
/usr/java/jre1.8.0_45/lib/security/java.policy
/usr/java/jre1.8.0_45/lib/security/java.security
/usr/java/jre1.8.0_45/lib/security/javaws.policy
/usr/java/jre1.8.0_45/lib/security/local_policy.jar
/usr/java/jre1.8.0_45/lib/security/trusted.libraries
/usr/java/jre1.8.0_45/lib/sound.properties
/usr/java/jre1.8.0_45/lib/tzdb.dat
/usr/java/jre1.8.0_45/man
/usr/java/jre1.8.0_45/man/ja
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/java.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/javaws.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/jjs.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/keytool.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/orbd.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/pack200.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/policytool.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/rmid.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/rmiregistry.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/servertool.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/tnameserv.1
/usr/java/jre1.8.0_45/man/ja_JP.UTF-8/man1/unpack200.1
/usr/java/jre1.8.0_45/man/man1
/usr/java/jre1.8.0_45/man/man1/java.1
/usr/java/jre1.8.0_45/man/man1/javaws.1
/usr/java/jre1.8.0_45/man/man1/jjs.1
/usr/java/jre1.8.0_45/man/man1/keytool.1
/usr/java/jre1.8.0_45/man/man1/orbd.1
/usr/java/jre1.8.0_45/man/man1/pack200.1
/usr/java/jre1.8.0_45/man/man1/policytool.1
/usr/java/jre1.8.0_45/man/man1/rmid.1
/usr/java/jre1.8.0_45/man/man1/rmiregistry.1
/usr/java/jre1.8.0_45/man/man1/servertool.1
/usr/java/jre1.8.0_45/man/man1/tnameserv.1
/usr/java/jre1.8.0_45/man/man1/unpack200.1
/usr/java/jre1.8.0_45/plugin
/usr/java/jre1.8.0_45/plugin/desktop
/usr/java/jre1.8.0_45/plugin/desktop/sun_java.desktop
/usr/java/jre1.8.0_45/plugin/desktop/sun_java.png
/usr/java/jre1.8.0_45/release
            EOS
            Facter::Util::Resolution.expects(:which).with("rpm").returns(true)
            Facter::Util::Resolution.expects(:exec).with("rpm -qf /usr/java/jre1.8.0_45/bin/java -l").returns(rpm_output)
            Facter.value(:java_libjvm).should == "/usr/java/jre1.8.0_45/lib/amd64/server/libjvm.so"
          end
        end
        context 'without rpm' do
          it do
            Facter::Util::Resolution.stubs(:exec)
            Facter::Util::Resolution.expects(:which).with("rpm").returns(false)
            Facter.value(:java_libjvm).should be_nil
          end
        end
      end
      context 'on osfamily Debian' do
        before {
          Facter.fact(:osfamily).stubs(:value).returns('Debian')
          Facter.fact(:java_path).stubs(:value).returns('/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java')
        }
        context 'without java' do
          before {
            Facter.fact(:java_path).stubs(:value).returns(nil)
          }
          it do
            Facter::Util::Resolution.stubs(:exec)
            Facter.value(:java_libjvm).should be_nil
          end
        end
        context 'with dpkg' do
          it do
            dpkg_S_output = <<-EOS
openjdk-7-jre-headless:amd64: /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
            EOS
            dpkg_L_output = <<-EOS
/.
/usr
/usr/lib
/usr/lib/jvm
/usr/lib/jvm/java-7-openjdk-amd64
/usr/lib/jvm/java-7-openjdk-amd64/bin
/usr/lib/jvm/java-7-openjdk-amd64/bin/java-rmi.cgi
/usr/lib/jvm/java-7-openjdk-amd64/jre
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/keytool
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/pack200
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/unpack200
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/tnameserv
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/servertool
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/orbd
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/rmiregistry
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/rmid
/usr/lib/jvm/java-7-openjdk-amd64/jre/ASSEMBLY_EXCEPTION
/usr/lib/jvm/java-7-openjdk-amd64/jre/THIRD_PARTY_README
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/jexec
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/charsets.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/javazic.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/jvm.hprof.txt
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/classlist
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/rt.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/management-agent.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/headless
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/headless/libmawt.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libawt.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libmanagement.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libunpack.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libattach.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libverify.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjawt.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjsound.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libj2gss.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libzip.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjava_crw_demo.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libfontmanager.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libsctp.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjava.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libj2krb5.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libnpt.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjsdt.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libdt_socket.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server/libjvm.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server/Xusage.txt
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjdwp.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/jvm.cfg-default
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjavajpeg.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/jli
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/jli/libjli.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libmlib_image.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjavalcms.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjsig.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libnio.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libj2pcsc.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libhprof.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libsaproc.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libnet.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libicedtea-sound.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjaas_unix.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libinstrument.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libj2pkcs11.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/meta-index
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/jce.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/currency.data
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/compilefontconfig.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/cmm
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/cmm/GRAY.pf
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/cmm/sRGB.pf
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/cmm/LINEAR_RGB.pf
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/cmm/CIEXYZ.pf
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/cmm/PYCC.pf
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/resources.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/management
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/US_export_policy.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/local_policy.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext/dnsns.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext/zipfs.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext/localedata.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext/icedtea-sound.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext/sunpkcs11.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext/sunjce_provider.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors/motif_CopyNoDrop32x32.gif
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors/motif_MoveDrop32x32.gif
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors/motif_LinkDrop32x32.gif
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors/motif_MoveNoDrop32x32.gif
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors/invalid32x32.gif
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors/motif_CopyDrop32x32.gif
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors/motif_LinkNoDrop32x32.gif
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/jar.binfmt
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/jsse.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/rhino.jar
/usr/lib/jvm/java-7-openjdk-amd64/jre/man
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/java.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/servertool.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/rmiregistry.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/tnameserv.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/orbd.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/pack200.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/unpack200.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/keytool.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/rmid.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/java.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/servertool.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/rmiregistry.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/tnameserv.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/orbd.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/pack200.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/unpack200.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/keytool.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja_JP.UTF-8/man1/rmid.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man
/usr/lib/jvm/java-7-openjdk-amd64/man/man1
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1
/usr/lib/jvm/.java-1.7.0-openjdk-amd64.jinfo
/usr/share
/usr/share/lintian
/usr/share/lintian/overrides
/usr/share/lintian/overrides/openjdk-7-jre-headless
/usr/share/doc
/usr/share/doc/openjdk-7-jre-headless
/usr/share/doc/openjdk-7-jre-headless/NEWS.IcedTea.gz
/usr/share/doc/openjdk-7-jre-headless/JAVA_HOME
/usr/share/doc/openjdk-7-jre-headless/copyright
/usr/share/doc/openjdk-7-jre-headless/README.IcedTea.gz
/usr/share/doc/openjdk-7-jre-headless/README.alternatives
/usr/share/doc/openjdk-7-jre-headless/README.Debian
/usr/share/doc/openjdk-7-jre-headless/changelog.Debian.gz
/usr/share/doc/openjdk-7-jre-headless/AUTHORS.IcedTea
/usr/share/binfmts
/etc
/etc/java-7-openjdk
/etc/java-7-openjdk/logging.properties
/etc/java-7-openjdk/calendars.properties
/etc/java-7-openjdk/jvm-amd64.cfg
/etc/java-7-openjdk/sound.properties
/etc/java-7-openjdk/content-types.properties
/etc/java-7-openjdk/psfontj2d.properties
/etc/java-7-openjdk/management
/etc/java-7-openjdk/management/snmp.acl
/etc/java-7-openjdk/management/jmxremote.password
/etc/java-7-openjdk/management/management.properties
/etc/java-7-openjdk/management/jmxremote.access
/etc/java-7-openjdk/security
/etc/java-7-openjdk/security/java.policy
/etc/java-7-openjdk/security/nss.cfg
/etc/java-7-openjdk/security/java.security
/etc/java-7-openjdk/flavormap.properties
/etc/java-7-openjdk/net.properties
/etc/java-7-openjdk/images
/etc/java-7-openjdk/images/cursors
/etc/java-7-openjdk/images/cursors/cursors.properties
/etc/java-7-openjdk/fontconfig.properties
/etc/java-7-openjdk/psfont.properties.ja
/etc/java-7-openjdk/accessibility.properties
/etc/java-7-openjdk/swing.properties
/etc/java-7-openjdk/tz.properties
/usr/lib/jvm/java-7-openjdk-amd64/bin/java
/usr/lib/jvm/java-7-openjdk-amd64/bin/keytool
/usr/lib/jvm/java-7-openjdk-amd64/bin/pack200
/usr/lib/jvm/java-7-openjdk-amd64/bin/unpack200
/usr/lib/jvm/java-7-openjdk-amd64/bin/tnameserv
/usr/lib/jvm/java-7-openjdk-amd64/bin/servertool
/usr/lib/jvm/java-7-openjdk-amd64/bin/orbd
/usr/lib/jvm/java-7-openjdk-amd64/bin/rmiregistry
/usr/lib/jvm/java-7-openjdk-amd64/bin/rmid
/usr/lib/jvm/java-7-openjdk-amd64/docs
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/logging.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/jvm.cfg
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server/libjsig.so
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/calendars.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/sound.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/content-types.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/psfontj2d.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/management/snmp.acl
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/management/jmxremote.password
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/management/management.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/management/jmxremote.access
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/zi
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.policy
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/nss.cfg
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/flavormap.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/net.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/images/cursors/cursors.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/fontconfig.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/psfont.properties.ja
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/accessibility.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/swing.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/tz.properties
/usr/lib/jvm/java-7-openjdk-amd64/jre/man/ja
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/java.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/servertool.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/rmiregistry.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/tnameserv.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/orbd.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/pack200.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/unpack200.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/keytool.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/man1/rmid.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/java.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/servertool.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/rmiregistry.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/tnameserv.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/orbd.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/pack200.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/unpack200.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/keytool.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/man/ja_JP.UTF-8/man1/rmid.1.gz
/usr/lib/jvm/java-1.7.0-openjdk-amd64
            EOS
            Facter::Util::Resolution.expects(:which).with("dpkg").returns(true)
            Facter::Util::Resolution.expects(:exec).with("dpkg -S /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java").returns(dpkg_S_output)
            Facter::Util::Resolution.expects(:exec).with("dpkg -L openjdk-7-jre-headless").returns(dpkg_L_output)
            Facter.value(:java_libjvm).should == "/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server/libjvm.so"
          end
        end
        context 'without dpkg' do
          it do
            Facter::Util::Resolution.stubs(:exec)
            Facter::Util::Resolution.expects(:which).with("dpkg").returns(false)
            Facter.value(:java_libjvm).should be_nil
          end
        end
      end
    end
  end
end
