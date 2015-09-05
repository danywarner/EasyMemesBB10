APP_NAME = EasyMemes

CONFIG += qt warn_on cascades10

include(config.pri)



LIBS += -lbbsystem 
LIBS += -lscreen
LIBS += -lbbdata 
LIBS += -lcrypto -lcurl -lpackageinfo -lbbdevice
LIBS += -lbbcascadespickers
LIBS += -lbbplatform
 
