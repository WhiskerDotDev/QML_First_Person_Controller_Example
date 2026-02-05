QT += core gui qml quick quick3d

SOURCES += \
        main.cpp \
        mymouseclass.cpp
#        movement.cpp

resources.files = main.qml crosshair_0.png crosshair_0_black.png
resources.prefix = /$${TARGET}
RESOURCES += resources



# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

!isEmpty(target.path): INSTALLS += target

HEADERS += \
    mymouseclass.h
#    movement.h
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin

DISTFILES += \
    Notes.txt
