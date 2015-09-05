#include "applicationui.hpp"

#include <bb/system/InvokeRequest>
#include <bb/cascades/Application>
#include <bb/system/CardDoneMessage>
#include <bb/data/JsonDataAccess>
#include <bb/system/SystemToast>
#include <bb/cascades/Window>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/NavigationPane>
#include <bb/cascades/LocaleHandler>
#include <bb/system/SystemPrompt>
#include <bb/cascades/Button>
 #include <QDir>
 #include <QStringList>
////freemium
#include <bb/platform/PaymentManager>
#include <bb/platform/PaymentConnectionMode>
#include <bb/platform/PaymentReply>
#include <bb/platform/PurchaseReply>
#include <bb/platform/CancelSubscriptionReply>
#include <bb/platform/DigitalGoodReply>
#include <bb/platform/ExistingPurchasesReply>
#include <bb/platform/PriceReply>
#include <bb/platform/SubscriptionStatusReply>
#include <bb/platform/SubscriptionTermsReply>
#include <bb/platform/PurchaseReceipt>
#include <bb/platform/DigitalGoodState>
#include <QTimer>
#include <QDateTime>
#include<bb/cascades/TextArea>

/////
using namespace bb::cascades;
using namespace bb::system;
using namespace bb::data;
using namespace bb::platform;

static QString receiptToString(bb::platform::PurchaseReceipt r)
{
  const QString initialPeriod = QString::number(r.initialPeriod());
  const QDateTime startDate = r.startDate();
  const QString startDateStr = startDate.isNull() ? "N/A" : startDate.toString();
  const QDateTime endDate = r.endDate();
  const QString endDateStr = endDate.isNull() ? "N/A" : endDate.toString();
  const QString isSubscr = r.isSubscription() ? "true" : "false";
  const QString itemStateStr = QString::number(static_cast<int>(r.state()));

  const QString displayString = "Date: " + r.date().toString() +
      "\nID/SKU: " + r.digitalGoodId() + "/" + r.digitalGoodSku() +
      "\nPurchaseID/licenseKey: " + r.purchaseId() + "/" + r.licenseKey() +
      "\nMetadata: " + r.purchaseMetadata() +
      "\nItemState/isSubscription?: " + itemStateStr + "/" + isSubscr +
      "\nStart/End: " + startDateStr + "/" + endDateStr +
      "\nInitialPeriod: " + initialPeriod + "\n";

    return displayString;
}

ApplicationUI::ApplicationUI(QObject *parent)
    : QObject(parent)
	, m_paymentManager(new PaymentManager(this))

{

	///freemium

		// Get the window group ID and pass it to the PaymentManager instance.
		const QString windowGroupId = bb::cascades::Application::instance()->mainWindow()->groupId();
		m_paymentManager->setWindowGroupId(windowGroupId);
		// Set the application name so that it shows up in the purchase banner.
		m_paymentManager->setApplicationName("Easy Memes");
		////freemium


	m_pTranslator = new QTranslator(this);
	    m_pLocaleHandler = new LocaleHandler(this);
	    if(!QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this, SLOT(onSystemLanguageChanged()))) {
	        // This is an abnormal situation! Something went wrong!
	        // Add own code to recover here
	        qWarning() << "Recovering from a failed connect()";
	    }
	    // initial load
	    onSystemLanguageChanged();
	    QDir tmp;
	    bool dircreated = tmp.mkpath("/accounts/1000/shared/misc/easymemes");

	    QDir tmp2;
	    bool dircreated2 = tmp2.mkpath("/accounts/1000/shared/misc/easymemes/mod");

	    if(dircreated2==true)
	    {
	    	qDebug("created 2");
	    }
	    else
	    {
	    	qDebug("NOT created2");
	    }
	    //bool dircreated=QDir::mkdir("EasyMemes");




	/*bool ok = connect(m_invokeManager,
					      SIGNAL(childCardDone(const bb::system::CardDoneMessage&)), this,
					      SLOT(childCardDone(const bb::system::CardDoneMessage&)));
		Q_ASSERT(ok);
		Q_UNUSED(ok);*/
}









void ApplicationUI::write_bitmap_header(int nbytes, QByteArray& ba, const int size[])
{
	char header[54];

	/* Set standard bitmap header */
	header[0] = 'B';
	header[1] = 'M';
	header[2] = nbytes & 0xff;
	header[3] = (nbytes >> 8) & 0xff;
	header[4] = (nbytes >> 16) & 0xff;
	header[5] = (nbytes >> 24) & 0xff;
	header[6] = 0;
	header[7] = 0;
	header[8] = 0;
	header[9] = 0;
	header[10] = 54;
	header[11] = 0;
	header[12] = 0;
	header[13] = 0;
	header[14] = 40;
	header[15] = 0;
	header[16] = 0;
	header[17] = 0;
	header[18] = size[0] & 0xff;
	header[19] = (size[0] >> 8) & 0xff;
	header[20] = (size[0] >> 16) & 0xff;
	header[21] = (size[0] >> 24) & 0xff;
	header[22] = -size[1] & 0xff;
	header[23] = (-size[1] >> 8) & 0xff;
	header[24] = (-size[1] >> 16) & 0xff;
	header[25] = (-size[1] >> 24) & 0xff;
	header[26] = 1;
	header[27] = 0;
	header[28] = 32;
	header[29] = 0;
	header[30] = 0;
	header[31] = 0;
	header[32] = 0;
	header[33] = 0;
	header[34] = 0; /* image size*/
	header[35] = 0;
	header[36] = 0;
	header[37] = 0;
	header[38] = 0x9;
	header[39] = 0x88;
	header[40] = 0;
	header[41] = 0;
	header[42] = 0x9l;
	header[43] = 0x88;
	header[44] = 0;
	header[45] = 0;
	header[46] = 0;
	header[47] = 0;
	header[48] = 0;
	header[49] = 0;
	header[50] = 0;
	header[51] = 0;
	header[52] = 0;
	header[53] = 0;

	ba.append(header, sizeof(header));
}

void ApplicationUI::capture(int width, int height, QString filename,int anchoCorte, int largoCorte)
{
	bool captured = false;

	try {
		screen_pixmap_t screen_pix;
		screen_buffer_t screenshot_buf;
		char *screenshot_ptr = NULL;
		int screenshot_stride = 0;
		screen_context_t context;
		screen_create_context(&context, 0);
		int usage, format;
		int size[2];

		screen_create_pixmap(&screen_pix, context);

		usage = SCREEN_USAGE_READ | SCREEN_USAGE_NATIVE;
		screen_set_pixmap_property_iv(screen_pix, SCREEN_PROPERTY_USAGE, &usage);

		format = SCREEN_FORMAT_RGBA8888;
		screen_set_pixmap_property_iv(screen_pix, SCREEN_PROPERTY_FORMAT, &format);

		size[0] = width;
		size[1] = height;
		screen_set_pixmap_property_iv(screen_pix, SCREEN_PROPERTY_BUFFER_SIZE, size);

		screen_create_pixmap_buffer(screen_pix);
		screen_get_pixmap_property_pv(screen_pix, SCREEN_PROPERTY_RENDER_BUFFERS,
									  (void**)&screenshot_buf);
		screen_get_buffer_property_pv(screenshot_buf, SCREEN_PROPERTY_POINTER,
									  (void**)&screenshot_ptr);
		screen_get_buffer_property_iv(screenshot_buf, SCREEN_PROPERTY_STRIDE,
									  &screenshot_stride);

		screen_read_window(Application::instance()->mainWindow()->handle(), screenshot_buf, 0, NULL ,0);

		QByteArray array;

		int nbytes = size[0] * size[1] * 4;
		write_bitmap_header(nbytes, array, size);

		for (int i = 0; i < size[1]; i++)
		{
			array.append(screenshot_ptr + i * screenshot_stride, size[0] * 4);
		}

		QImage image = QImage::fromData(array, "BMP");
				QImage copy;
				copy=image.copy(0,0,anchoCorte,largoCorte);
				//Qt::AspectRatioMode aspectRatioMode = Qt::IgnoreAspectRatio;
				//Qt::TransformationMode transformMode = Qt::FastTransformation;
				//QImage scaled=copy.scaled(599,500,aspectRatioMode  ,transformMode);
				QFile outFile("shared/photos/"+ filename +".jpg");
				outFile.open(QIODevice::WriteOnly);
				copy.save(&outFile, "JPEG");

		screen_destroy_pixmap(screen_pix);

		captured = true;
	} catch(std::exception &e) {
		captured = false;
	}


}

/*void ApplicationUI::childCardDone(const bb::system::CardDoneMessage &doneMessage)
{
	SystemToast* toast = new SystemToast(this);
	if (doneMessage.dataType().compare("application/json") == 0)
	{
		// The data type from the venue search card is application/json
		// so we need to convert the json data to a map here. This will match
		// the json format from the Foursquare docs at http://developer.foursquare.com
		JsonDataAccess jda;
		const QVariantMap venueMap = jda.loadFromBuffer(doneMessage.data()).toMap();
		toast->setBody(QString("User Picked: ") + venueMap.value("name","").toString());
	}
	else
	{
		toast->setBody(doneMessage.data());
	}
	toast->show();
}*/

QByteArray ApplicationUI::encodeQString(const QString& toEncode) const {
	return toEncode.toUtf8();
}

void ApplicationUI::invoke(const QString &target, const QString &action,
		const QString &mimetype, const QString &uri) {
	// Create a new invocation request
	InvokeRequest request;

	request.setTarget(target);
	request.setAction(action);

	if (target == QLatin1String("com.rim.bb.app.facebook")) {
		QVariantMap payload;

		if (!uri.isEmpty()) {
			payload["object_type"] = mimetype;
			payload["object_id"] = uri;
		} else {
			// Open the BlackBerry North America page by default
			payload["object_type"] = "page";
			payload["object_id"] = "328506290597521";
		}

		request.setMetadata(payload);
	} else {
		request.setUri(uri);
	}

	m_invokeManager->invoke(request);
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    // Initiate, load and install the application translation files.
    QString locale_string = QLocale().name();
    QString file_name = QString("EasyMemes_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm"))
    {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}

// A public function to display a SystemPrompt in your UI
void ApplicationUI::showPrompt()
{

    // Set up the prompt with a title, a default for your inputField,
    // and some text to present to the user to remind them to enter
    // text. This prompt will be dismissed automatically when the
    // button is tapped.

    /*SystemPrompt *prompt = new SystemPrompt();
    prompt->setTitle("Enter a new file name");
    prompt->setDismissAutomatically(true);
    prompt->inputField()->setDefaultText("Meme123");
    prompt->inputField()->setEmptyText("Enter a new filename ...");

    // Connect the finished() signal to the onPromptFinished() slot.

    bool success = QObject::connect(prompt,
         SIGNAL(finished(bb::system::SystemUiResult::Type)),
         this,
         SLOT(onPromptFinished(bb::system::SystemUiResult::Type)));

    if (success) {
        // Signal was successfully connected.
        // Now show the prompt in your UI.

        prompt->show();
    } else {
        // Failed to connect to signal.
        // This is not normal in most cases and can be a critical
        // situation for your app! Make sure you know exactly why
        // this has happened. Add some code to recover from the lost
        // connection below this line.
        prompt->deleteLater();
    }*/
}

void ApplicationUI::onPromptFinished(bb::system::SystemUiResult::Type type)
{

	SystemPrompt *prompt = qobject_cast<SystemPrompt *>(sender());
	QString text = prompt->inputFieldTextEntry() ;
    if (type == SystemUiResult::ConfirmButtonSelection)
    {

        qDebug() << "Prompt Accepted: "<<text ;
       // saveMeme(text);

        // The user accepted the prompt.
    }
    else {
        qDebug() << "Prompt Rejected";
        // The user rejected the prompt.
    }
}

void ApplicationUI::saveMeme()
{
	// QString text;
	 QDateTime now = QDateTime::currentDateTime();
	 //qDebug() << "saving: "<<text ;
	 bool saved=QFile::copy("shared/photos/1Meme.jpg","shared/misc/easymemes/"+now.toString()+".jpg");
	 if(saved==true)
	 {
		 showToast("Meme Saved");
	 }
	 else
	 {
		 //showToast("Error: Name Already Exists!");
	 }

}

void ApplicationUI::showToast(QString message)
{
    SystemToast *toast = new SystemToast(this);

    toast->setBody(message);
    toast->setPosition(SystemUiPosition::MiddleCenter);
    toast->show();
}

void ApplicationUI::showSavedMemes()
{
	QStringList listaMemes;
	QDir dir("/accounts/1000/shared/misc/easymemes/");


	 listaMemes= dir.entryList(listaMemes, QDir::Files, QDir::Time);

	 if(listaMemes.isEmpty())
	 {
		 qDebug() << "lista vacia";
	 }
	 else{
		 qDebug() << "lista no vacia";
		 QListIterator<QString> it(listaMemes);

		 QFile newFile("shared/misc/easymemes/mod/modmymemes.xml");
		 if(!newFile.open(QIODevice::ReadWrite))
		 {
			 qDebug() << "no se pudo crear paila ";
		 }
		 else
		 {
			 qDebug() << "SIII se pudo crear ";
			 QTextStream out(&newFile);
			 out << "<root>" <<"\n";

			 while(it.hasNext())
					 {
						 out << "<item image=\""+it.next()+"\"/>\n";
					 }
			 out << "</root>" <<"\n";
			 newFile.close();
		 }
	 }
}

void ApplicationUI::eraseFile(QString path)
{
	qDebug()<<path;
	bool saved=QFile::remove(path);
}

void ApplicationUI::purchase(const QString &sku)
{

    qDebug() << "\nRequesting purchase: " << "SKU:" << sku;

    const PurchaseReply *reply = m_paymentManager->requestPurchase(sku);
    bool ok = connect(reply, SIGNAL(finished()), SLOT(handlePurchase()));
    Q_ASSERT(ok);
    Q_UNUSED(ok);
}

void ApplicationUI::handlePurchase()
{
	 	 PurchaseReply *reply = qobject_cast<bb::platform::PurchaseReply*>(sender());
	    Q_ASSERT(reply);

	    //emits error signal upon errors.
	    if (reply->isError()) {
	        qDebug() << "Purchase response error. Code(" << reply->errorCode() << ") Text(" << reply->errorText() << ")";
	        emit infoResponseError(reply->errorCode(), reply->errorText());

	    //emits success signal upon success
	    } else {
	        const QString displayString = receiptToString(reply->receipt());

	        qDebug() << "Purchase response success. " << displayString;
	        //QSettings seti("danywarner", "easymemes");
	        QSettings easySettings("danywarner", "easymemes");
	        easySettings.setValue("purchasedMoreMemes",true);
	        easySettings.sync();
	        emit purchaseResponseSuccess(displayString);
	    }

	    reply->deleteLater();
}

bool ApplicationUI::verificarLocalCompras()
{
	QSettings easySettings("danywarner", "easymemes");
	bool haComprado=easySettings.value("purchasedMoreMemes").toBool();
	return haComprado;
}

/**
 * Request existing purchases from the payment service.
 */
void ApplicationUI::getExistingPurchases(bool refresh)
{
    qDebug() << "Get existing. refresh: " << refresh;

    const ExistingPurchasesReply *reply = m_paymentManager->requestExistingPurchases(refresh);
    bool ok = connect(reply, SIGNAL(finished()), SLOT(existingPurchasesResponse()));
    Q_ASSERT(ok);
    Q_UNUSED(ok);
}

void ApplicationUI::handleHasPurchased()
{

}
void ApplicationUI::existingPurchasesResponse()
{

	  bb::platform::ExistingPurchasesReply *reply = qobject_cast<bb::platform::ExistingPurchasesReply*>(sender());
	    Q_ASSERT(reply);

	    //emits error signal upon errors.
	    if (reply->isError()) {
	        qDebug() << "Existing purchases response error. Code(" << reply->errorCode() << ") Text(" << reply->errorText() << ")";
	        emit infoResponseError(reply->errorCode(), reply->errorText());

	    //emits success signal upon success
	    } else
	    {
	        qDebug() << "Existing purchases response success. (TODO)";
	        const QList<PurchaseReceipt> receipts = reply->purchases();

	        if (receipts.isEmpty())
	        {
	            qDebug() << "Existing purchases response success. (No purchases)";

	            emit existingPurchasesResponseSuccess("(No purchases)");
	            qDebug() << "Emitido";

	        } else
	        {
	            //For each purchase format a user readable string representation of the receipt.


	            QString displayString;
	            Q_FOREACH(PurchaseReceipt r, receipts)
	            {
	                displayString += (receiptToString(r) + "\n");
	            }

	            QSettings easySettings("danywarner", "easymemes");
	           	easySettings.setValue("purchasedMoreMemes",true);
	           	easySettings.sync();



	            emit existingPurchasesResponseSuccess2(displayString);
	        }
	    }

	    reply->deleteLater();
}

void ApplicationUI::startTimer()
{
	qDebug()<<"HOlA ZORRA";
	 QTimer *timer = new QTimer(this);
	 connect(timer, SIGNAL(timeout()), this, SLOT(performTimerActions()));
	 timer->setSingleShot(true);
	 timer->start(10);
}

void ApplicationUI::startTimerq10()
{
	qDebug()<<"HOlA q10";
	 QTimer *timer = new QTimer(this);
	 connect(timer, SIGNAL(timeout()), this, SLOT(performTimerActionsq10()));
	 timer->setSingleShot(true);
	 timer->start(500);
}


void ApplicationUI::startTimer2()
{
	qDebug()<<"HOlA ZORRA";
	 QTimer *timer = new QTimer(this);
	 connect(timer, SIGNAL(timeout()), this, SLOT(performTimerActions()));
	 timer->setSingleShot(true);
	 timer->start(600);
}

void ApplicationUI::performTimerActions()
{
	emit callTimerDone();
}

void ApplicationUI::performTimerActionsq10()
{
	emit callTimerDone2();
}






