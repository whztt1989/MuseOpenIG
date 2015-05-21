#-------------------------------------------------
#
# Project created by QtCreator 2015-01-12T12:01:03
#
#-------------------------------------------------

QT       -= core gui

CONFIG += silent

TARGET = IgPlugin-SilverLining
TEMPLATE = lib

DEFINES += IGPLUGINSILVERLINING_LIBRARY

DESTDIR = /usr/local/lib/igplugins

QMAKE_CXXFLAGS += -fpermissive -shared-libgcc -D_GLIBCXX_DLL

CONFIG -= warn_on

SOURCES += igpluginsilverlining.cpp \
    SkyDrawable.cpp \
    CloudsDrawable.cpp

HEADERS += \
    CloudsDrawable.h \
    SkyDrawable.h \
    AtmosphereReference.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

LIBS += -losg -losgDB -losgViewer -lIgPluginCore -lSilverLiningOpenGL -lIgCore

FILE = $${PWD}/libIgPlugin-SilverLining.so.xml
DDIR = $${DESTDIR}

mac: DDIR = $${DESTDIR}/libIgPlugin-SilverLining.dylib.xml

QMAKE_POST_LINK = $$QMAKE_COPY $$quote($$FILE) $$quote($$DDIR) $$escape_expand(\\n\\t)

INCLUDEPATH += /usr/local/include
DEPENDPATH += /usr/local/include

INCLUDEPATH += ../
DEPENDPATH += ../

INCLUDEPATH += /usr/local/lib64
DEPENDPATH += /usr/local/lib64

INCLUDEPATH += /usr/local/include/Public_Headers
DEPENDPATH += /usr/local/include/Public_Headers

unix:!mac {
LIBS += -lGL -lGLU
}

win32:!mac{
 LIBS += -lopengl32 -lglu32
}

mac: LIBS += -framework openGL

LIBS += -lOpenThreads

OTHER_FILES += \
    libIgPlugin-SilverLining.so.xml

win32 {
    OSGROOT = $$(OSG_ROOT)
    isEmpty(OSGROOT) {
        message(\"OpenSceneGraph\" not detected...)
    }
    else {
        message(\"OpenSceneGraph\" detected in \"$$OSGROOT\")
        INCLUDEPATH += $$OSGROOT/include
    }
    OSGBUILD = $$(OSG_BUILD)
    isEmpty(OSGBUILD) {
        message(\"OpenSceneGraph build\" not detected...)
    }
    else {
        message(\"OpenSceneGraph build\" detected in \"$$OSGBUILD\")
        DEPENDPATH += $$OSGBUILD/lib
        INCLUDEPATH += $$OSGBUILD/include
        LIBS += -L$$OSGBUILD/lib
    }

    OPENIGBUILD = $$(OPENIG_BUILD)
    isEmpty (OPENIGBUILD) {
        OPENIGBUILD = $$IN_PWD/..
    }
    DESTDIR = $$OPENIGBUILD/lib
    DLLDESTDIR = $$OPENIGBUILD/bin/igplugins

    LIBS += -L$$OPENIGBUILD/lib

    SLROOT = $$(SILVERLINING)
    isEmpty(SLROOT) {
        message(\"SilverLining\" not detected...)
    }
    else {
        message(\"SilverLining\" detected in \"$$SLROOT\")
        INCLUDEPATH += $$quote(\"$$SLROOT/Public Headers\")
        message($$INCLUDEPATH)
    }
    SLBUILD = $$(SILVERLINING_BUILD)
    isEmpty(SLBUILD) {
        message(\"SilverLining build\" not detected...)
    }
    else {
        message(\"SilverLining build\" detected in \"$$SLBUILD\")
        DEPENDPATH += $$SLBUILD
        LIBS += -L$$SLBUILD
    }

    LIBS += -lstdc++.dll

    FILE = $${PWD}/libIgPlugin-SilverLining.so.xml
    DFILE = $${DLLDESTDIR}/IgPlugin-SilverLining.dll.xml

    win32:FILE ~= s,/,\\,g
    win32:DFILE ~= s,/,\\,g

    QMAKE_POST_LINK = $$QMAKE_COPY $$quote($$FILE) $$quote($$DFILE) $$escape_expand(\\n\\t)
}

DISTFILES += \
    Makefile.compro.mingw32


