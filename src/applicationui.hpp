#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <bb/system/InvokeManager>
#include <screen/screen.h>
#include <bb/system/SystemUiResult.hpp>
#include <bb/platform/PaymentManager>


namespace bb
{
namespace system
	{
		class InvokeManager;
	}
namespace cascades
    {
        class Application;
        class LocaleHandler;
    }
}

class ApplicationUI : public QObject
{
    Q_OBJECT
public:

    ApplicationUI(QObject *parent = 0);
    Q_INVOKABLE void getExistingPurchases(bool refresh);
    Q_INVOKABLE QByteArray encodeQString(const QString& toEncode) const;
    Q_INVOKABLE void capture(int width, int height, QString filename,int anchoCorte, int largoCorte);
    Q_INVOKABLE void showPrompt();
    Q_INVOKABLE void showSavedMemes();
    Q_INVOKABLE void eraseFile(QString path);
    Q_INVOKABLE void purchase(const QString &sku);
    Q_INVOKABLE bool verificarLocalCompras();
    Q_INVOKABLE void startTimer();
    Q_INVOKABLE void startTimerq10();
    Q_INVOKABLE void startTimer2();
    Q_INVOKABLE void saveMeme();


public Q_SLOTS:
        // This method is called to invoke another application with the current configuration
        void invoke(const QString &target, const QString &action,
                    const QString &mimetype, const QString &uri);

        //void childCardDone(const bb::system::CardDoneMessage &doneMessage);
        void write_bitmap_header(int nbytes, QByteArray& ba, const int size[]);
       // void capture(int width, int height, screen_context_t context);

        void handlePurchase();
        void existingPurchasesResponse();
        void handleHasPurchased();
        void performTimerActions();
        void performTimerActionsq10();

        Q_SIGNALS:



        void callTimerDone();
        void callTimerDone2();

		void purchaseResponseSuccess(const QString &receiptString);

        void infoResponseError(int errorCode, const QString &errorText);

        void existingPurchasesResponseSuccess(const QString &receiptsString);
        void existingPurchasesResponseSuccess2(const QString &receiptsString);

private:
    // The central object to manage invocations
    bb::platform::PaymentManager *m_paymentManager;
    bb::system::InvokeManager* m_invokeManager;
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;

    void showToast(QString message);



    private slots:
        void onSystemLanguageChanged();
        void onPromptFinished(bb::system::SystemUiResult::Type type);


};

#endif /* ApplicationUI_HPP_ */
