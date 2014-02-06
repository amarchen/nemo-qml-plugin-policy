TARGET = nemopolicy
PLUGIN_IMPORT_PATH = harbour/flashlight/org/nemomobile/policy

TEMPLATE = lib
CONFIG += qt plugin hide_symbols link_pkgconfig
equals(QT_MAJOR_VERSION, 4): QT += declarative
equals(QT_MAJOR_VERSION, 5){
    QT -= gui
    QT += qml
}

equals(QT_MAJOR_VERSION, 4): target.path = $$[QT_INSTALL_IMPORTS]/$$PLUGIN_IMPORT_PATH
equals(QT_MAJOR_VERSION, 5): target.path = /usr/share/harbour-flashlight/lib/$$PLUGIN_IMPORT_PATH
INSTALLS += target

qmldir.files += $$_PRO_FILE_PWD_/qmldir
qmldir.path +=  $$target.path
INSTALLS += qmldir

equals(QT_MAJOR_VERSION, 4): PKGCONFIG += libresourceqt1
equals(QT_MAJOR_VERSION, 5): PKGCONFIG += libresourceqt5

SOURCES += \
        plugin.cpp \
        permissions.cpp \
        resource.cpp

HEADERS += \
        permissions.h \
        resource.h

equals(QT_MAJOR_VERSION, 5): DEFINES += QT_VERSION_5
