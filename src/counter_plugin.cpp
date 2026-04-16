#include "counter_plugin.h"
#include "CounterBackend.h"

#include <QDebug>

CounterPlugin::CounterPlugin(QObject* parent)
    : QObject(parent)
{
}

CounterPlugin::~CounterPlugin() = default;

void CounterPlugin::initLogos(LogosAPI* api)
{
    Q_UNUSED(api)
    if (m_backend) return;
    m_backend = new CounterBackend(this);
    setBackend(m_backend);
    qDebug() << "CounterPlugin: backend initialized";
}
