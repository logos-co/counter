#pragma once

#include "rep_counter_source.h"

class CounterBackend : public CounterSimpleSource {
    Q_OBJECT

public:
    explicit CounterBackend(QObject* parent = nullptr);

public slots:
    void increment() override;
};
