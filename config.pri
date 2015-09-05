# Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR =  $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        INCLUDEPATH +=  $$quote(/Applications/flurry2)

        DEPENDPATH +=  $$quote(/Applications/flurry2)

        LIBS += -lFlurry

        LIBS +=  $$quote(-L/Applications/flurry2/Flurry/armle-v7)

        PRE_TARGETDEPS +=  $$quote(/Applications/flurry2/Flurry/armle-v7)

        SOURCES +=  $$quote($$BASEDIR/src/applicationui.cpp) \
                 $$quote($$BASEDIR/src/main.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/applicationui.hpp)
    }

    CONFIG(release, debug|release) {
        INCLUDEPATH +=  $$quote(/Applications/flurry2)

        DEPENDPATH +=  $$quote(/Applications/flurry2)

        LIBS += -lFlurry

        LIBS +=  $$quote(-L/Applications/flurry2/Flurry/armle-v7)

        PRE_TARGETDEPS +=  $$quote(/Applications/flurry2/Flurry/armle-v7)

        SOURCES +=  $$quote($$BASEDIR/src/applicationui.cpp) \
                 $$quote($$BASEDIR/src/main.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/applicationui.hpp)
    }
}

simulator {
    CONFIG(debug, debug|release) {
        INCLUDEPATH +=  $$quote(/Applications/flurry2)

        DEPENDPATH +=  $$quote(/Applications/flurry2)

        LIBS += -lFlurry

        LIBS +=  $$quote(-L/Applications/flurry2/Flurry/x86)

        PRE_TARGETDEPS +=  $$quote(/Applications/flurry2/Flurry/x86)

        SOURCES +=  $$quote($$BASEDIR/src/applicationui.cpp) \
                 $$quote($$BASEDIR/src/main.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/applicationui.hpp)
    }
}

INCLUDEPATH +=  $$quote($$BASEDIR/src)

CONFIG += precompile_header

PRECOMPILED_HEADER =  $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES +=  $$quote($$BASEDIR/../src/*.c) \
             $$quote($$BASEDIR/../src/*.c++) \
             $$quote($$BASEDIR/../src/*.cc) \
             $$quote($$BASEDIR/../src/*.cpp) \
             $$quote($$BASEDIR/../src/*.cxx) \
             $$quote($$BASEDIR/../assets/*.qml) \
             $$quote($$BASEDIR/../assets/*.js) \
             $$quote($$BASEDIR/../assets/*.qs) \
             $$quote($$BASEDIR/../assets/720x1280/*.qml) \
             $$quote($$BASEDIR/../assets/720x1280/*.js) \
             $$quote($$BASEDIR/../assets/720x1280/*.qs) \
             $$quote($$BASEDIR/../assets/720x720/*.qml) \
             $$quote($$BASEDIR/../assets/720x720/*.js) \
             $$quote($$BASEDIR/../assets/720x720/*.qs) \
             $$quote($$BASEDIR/../assets/768x1280/*.qml) \
             $$quote($$BASEDIR/../assets/768x1280/*.js) \
             $$quote($$BASEDIR/../assets/768x1280/*.qs) \
             $$quote($$BASEDIR/../assets/colors/*.qml) \
             $$quote($$BASEDIR/../assets/colors/*.js) \
             $$quote($$BASEDIR/../assets/colors/*.qs) \
             $$quote($$BASEDIR/../assets/icons/*.qml) \
             $$quote($$BASEDIR/../assets/icons/*.js) \
             $$quote($$BASEDIR/../assets/icons/*.qs) \
             $$quote($$BASEDIR/../assets/images/*.qml) \
             $$quote($$BASEDIR/../assets/images/*.js) \
             $$quote($$BASEDIR/../assets/images/*.qs) \
             $$quote($$BASEDIR/../assets/screenshots/*.qml) \
             $$quote($$BASEDIR/../assets/screenshots/*.js) \
             $$quote($$BASEDIR/../assets/screenshots/*.qs) \
             $$quote($$BASEDIR/../assets/splash/*.qml) \
             $$quote($$BASEDIR/../assets/splash/*.js) \
             $$quote($$BASEDIR/../assets/splash/*.qs)

    HEADERS +=  $$quote($$BASEDIR/../src/*.h) \
             $$quote($$BASEDIR/../src/*.h++) \
             $$quote($$BASEDIR/../src/*.hh) \
             $$quote($$BASEDIR/../src/*.hpp) \
             $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS =  $$quote($${TARGET}.ts)