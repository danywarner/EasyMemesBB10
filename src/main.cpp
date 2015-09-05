
#include <bb/cascades/Application>
#include <QLocale>
#include <QTranslator>
#include "applicationui.hpp"
#include <bb/cascades/AbstractPane>
#include <bb/cascades/QmlDocument>
#include <QLocale>
#include <QTranslator>
#include <Qt/qdeclarativedebug.h>
#include <bb/cascades/Button>


//#include <bb/data/DataSource>
//#include <bb/system/SystemPrompt>

#include <Flurry.h>

#include <bb/platform/PaymentManager>


using namespace bb::cascades;
using namespace bb::platform;


Q_DECL_EXPORT int main(int argc, char **argv)
{
	Flurry::Analytics::StartSession("MY7C8RDV59PT6S8XD2FX");


	// qmlRegisterType<bb::system::SystemPrompt>("bb.system", 1, 0, "SystemPrompt");
	 //bb::data::DataSource::registerQmlTypes();

    Application app(argc, argv);


    //freemium
    PaymentManager::setConnectionMode(PaymentConnectionMode::Production);
    qmlRegisterType<ApplicationUI>("com.example.EasyMemes", 1, 0, "ApplicationUI");
    ///freemium

        //! [0]
        QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(&app);
        qml->setContextProperty("_applicationui", new ApplicationUI(&app));

        QmlDocument *qml2 = QmlDocument::create("asset:///MemeView.qml").parent(&app);
                qml2->setContextProperty("_apui", new ApplicationUI(&app));

        // Retrieve the path to the app's working directory
        const QString workDir = QDir::currentPath();

        // Build the path, add it as a context property,
        // and expose it to QML
        QVariantMap dirPaths;
        dirPaths["camera"] = QString::fromLatin1("file://%1/shared/camera/").arg(workDir);
        dirPaths["files"] = QString::fromLatin1("file://%1/shared/photos/").arg(workDir);
        dirPaths["asset"] = QString::fromLatin1("file://%1/app/native/assets/").arg(workDir);
        dirPaths["ememes"] = QString::fromLatin1("file://%1/shared/misc/easymemes/").arg(workDir);
        dirPaths["emmod"] = QString::fromLatin1("file://%1/shared/misc/easymemes/mod/").arg(workDir);

        qml->documentContext()->setContextProperty("_dirPaths", dirPaths);

        AbstractPane *root = qml->createRootObject<AbstractPane>();

        //freemium

        QPointer<bb::cascades::Button> moreMemesButton = root->findChild<bb::cascades::Button*>("moreMemesName");

       // moreMemesButton->setVisible(false);
        //freemium
        app.setScene(root);


    // Enter the application main event loop.
    return Application::exec();
}
