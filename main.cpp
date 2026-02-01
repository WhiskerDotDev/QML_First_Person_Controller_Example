#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mymouseclass.h"

int main(int argc, char *argv[])
{
QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/LetsGameJam/main.qml"));
    qmlRegisterType<myMouseClass>("myMouseClass", 1, 0, "Custom_mouseClass");
    //When Registering a QML type (as with line of code above) make sure the QML name (last parameter) begins with a capital letter.

    engine.load(url);
    return app.exec();
}
