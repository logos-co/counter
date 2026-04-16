#ifndef COUNTER_PLUGIN_H
#define COUNTER_PLUGIN_H

#include <QObject>
#include <QString>
#include "counter_interface.h"
#include "LogosViewPluginBase.h"

class LogosAPI;
class CounterBackend;

class CounterPlugin : public QObject,
                      public CounterInterface,
                      public CounterViewPluginBase
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID CounterInterface_iid FILE "metadata.json")
    Q_INTERFACES(CounterInterface)

public:
    explicit CounterPlugin(QObject* parent = nullptr);
    ~CounterPlugin() override;

    QString name()    const override { return "counter"; }
    QString version() const override { return "1.0.0"; }

    Q_INVOKABLE void initLogos(LogosAPI* api);

private:
    CounterBackend* m_backend = nullptr;
};

#endif
