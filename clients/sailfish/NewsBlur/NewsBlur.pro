# The name of your app
TARGET = NewsBlur

# C++ sources
SOURCES += main.cpp

# C++ headers
HEADERS +=

# QML files and folders
qml.files = *.qml pages cover main.qml

# The .desktop file
desktop.files = NewsBlur.desktop

# Please do not modify the following line.
include(sailfishapplication/sailfishapplication.pri)

OTHER_FILES = \
    rpm/NewsBlur.yaml \
    rpm/NewsBlur.spec \
    pages/Settings.qml \
    newsblurApi.js

