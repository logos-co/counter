#include "CounterBackend.h"

CounterBackend::CounterBackend(QObject* parent)
    : CounterSimpleSource(parent)
{
    setCount(0);
}

void CounterBackend::increment()
{
    setCount(count() + 1);
}
