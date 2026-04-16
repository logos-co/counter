#ifndef COUNTER_INTERFACE_H
#define COUNTER_INTERFACE_H

#include <QObject>
#include <QString>
#include "interface.h"

class CounterInterface : public PluginInterface
{
public:
    virtual ~CounterInterface() = default;
};

#define CounterInterface_iid "org.logos.CounterInterface"
Q_DECLARE_INTERFACE(CounterInterface, CounterInterface_iid)

#endif
