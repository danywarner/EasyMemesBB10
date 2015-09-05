/****************************************************************************
** Meta object code from reading C++ file 'applicationui.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/applicationui.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'applicationui.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ApplicationUI[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      27,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x05,
      31,   14,   14,   14, 0x05,
      62,   48,   14,   14, 0x05,
     115,   95,   14,   14, 0x05,
     161,  146,   14,   14, 0x05,
     203,  146,   14,   14, 0x05,

 // slots: signature, parameters, type, tag, flags
     273,  246,   14,   14, 0x0a,
     328,  313,   14,   14, 0x0a,
     377,   14,   14,   14, 0x0a,
     394,   14,   14,   14, 0x0a,
     422,   14,   14,   14, 0x0a,
     443,   14,   14,   14, 0x0a,
     465,   14,   14,   14, 0x0a,
     490,   14,   14,   14, 0x08,
     521,  516,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
     580,  572,   14,   14, 0x02,
     627,  618,  607,   14, 0x02,
     694,  650,   14,   14, 0x02,
     727,   14,   14,   14, 0x02,
     740,   14,   14,   14, 0x02,
     762,  757,   14,   14, 0x02,
     785,  781,   14,   14, 0x02,
     808,   14,  803,   14, 0x02,
     832,   14,   14,   14, 0x02,
     845,   14,   14,   14, 0x02,
     861,   14,   14,   14, 0x02,
     875,   14,   14,   14, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_ApplicationUI[] = {
    "ApplicationUI\0\0callTimerDone()\0"
    "callTimerDone2()\0receiptString\0"
    "purchaseResponseSuccess(QString)\0"
    "errorCode,errorText\0infoResponseError(int,QString)\0"
    "receiptsString\0existingPurchasesResponseSuccess(QString)\0"
    "existingPurchasesResponseSuccess2(QString)\0"
    "target,action,mimetype,uri\0"
    "invoke(QString,QString,QString,QString)\0"
    "nbytes,ba,size\0"
    "write_bitmap_header(int,QByteArray&,const int[])\0"
    "handlePurchase()\0existingPurchasesResponse()\0"
    "handleHasPurchased()\0performTimerActions()\0"
    "performTimerActionsq10()\0"
    "onSystemLanguageChanged()\0type\0"
    "onPromptFinished(bb::system::SystemUiResult::Type)\0"
    "refresh\0getExistingPurchases(bool)\0"
    "QByteArray\0toEncode\0encodeQString(QString)\0"
    "width,height,filename,anchoCorte,largoCorte\0"
    "capture(int,int,QString,int,int)\0"
    "showPrompt()\0showSavedMemes()\0path\0"
    "eraseFile(QString)\0sku\0purchase(QString)\0"
    "bool\0verificarLocalCompras()\0startTimer()\0"
    "startTimerq10()\0startTimer2()\0saveMeme()\0"
};

void ApplicationUI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ApplicationUI *_t = static_cast<ApplicationUI *>(_o);
        switch (_id) {
        case 0: _t->callTimerDone(); break;
        case 1: _t->callTimerDone2(); break;
        case 2: _t->purchaseResponseSuccess((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->infoResponseError((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 4: _t->existingPurchasesResponseSuccess((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->existingPurchasesResponseSuccess2((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->invoke((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4]))); break;
        case 7: _t->write_bitmap_header((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QByteArray(*)>(_a[2])),(*reinterpret_cast< const int(*)[]>(_a[3]))); break;
        case 8: _t->handlePurchase(); break;
        case 9: _t->existingPurchasesResponse(); break;
        case 10: _t->handleHasPurchased(); break;
        case 11: _t->performTimerActions(); break;
        case 12: _t->performTimerActionsq10(); break;
        case 13: _t->onSystemLanguageChanged(); break;
        case 14: _t->onPromptFinished((*reinterpret_cast< bb::system::SystemUiResult::Type(*)>(_a[1]))); break;
        case 15: _t->getExistingPurchases((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 16: { QByteArray _r = _t->encodeQString((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = _r; }  break;
        case 17: _t->capture((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5]))); break;
        case 18: _t->showPrompt(); break;
        case 19: _t->showSavedMemes(); break;
        case 20: _t->eraseFile((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 21: _t->purchase((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 22: { bool _r = _t->verificarLocalCompras();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 23: _t->startTimer(); break;
        case 24: _t->startTimerq10(); break;
        case 25: _t->startTimer2(); break;
        case 26: _t->saveMeme(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ApplicationUI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ApplicationUI::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ApplicationUI,
      qt_meta_data_ApplicationUI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ApplicationUI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ApplicationUI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ApplicationUI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ApplicationUI))
        return static_cast<void*>(const_cast< ApplicationUI*>(this));
    return QObject::qt_metacast(_clname);
}

int ApplicationUI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 27)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 27;
    }
    return _id;
}

// SIGNAL 0
void ApplicationUI::callTimerDone()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void ApplicationUI::callTimerDone2()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void ApplicationUI::purchaseResponseSuccess(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void ApplicationUI::infoResponseError(int _t1, const QString & _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void ApplicationUI::existingPurchasesResponseSuccess(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void ApplicationUI::existingPurchasesResponseSuccess2(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}
QT_END_MOC_NAMESPACE
