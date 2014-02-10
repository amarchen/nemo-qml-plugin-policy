##
## PROJECT_SHORTNAME is to be set in .yaml/.spec to prepare plugin for your app
## If your app name is harbour-mycoolapp, PROJECT_SHORTNAME needs to be "mycoolapp" (without quotes)
## You will still need to modify qmldir for your app manually, I don't know how to make changes there
## during the preprocessing step
##
## Pull requests for automating that are very welcome at https://github.com/amarchen/nemo-qml-plugin-policy
##
TARGET = nemopolicy
PLUGIN_IMPORT_PATH = harbour/$$PROJECT_SHORTNAME/org/nemomobile/policy

#message($$PROJECT_SHORTNAME)
FULL_PLUGIN_PATH=$$join(PROJECT_SHORTNAME, "", harbour., .org.nemomobile.policy)
#message($$FULL_PLUGIN_PATH)
DEFINES += PROJECT_SHORTNAME=\\\"$$PROJECT_SHORTNAME\\\"
DEFINES += FULL_PLUGIN_PATH=\\\"$$FULL_PLUGIN_PATH\\\"


TEMPLATE = lib
CONFIG += qt plugin hide_symbols link_pkgconfig
equals(QT_MAJOR_VERSION, 4): QT += declarative
equals(QT_MAJOR_VERSION, 5){
    QT -= gui
    QT += qml
}

equals(QT_MAJOR_VERSION, 4): target.path = $$[QT_INSTALL_IMPORTS]/$$PLUGIN_IMPORT_PATH
equals(QT_MAJOR_VERSION, 5): target.path = /usr/share/harbour-$$PROJECT_SHORTNAME/lib/$$PLUGIN_IMPORT_PATH
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
