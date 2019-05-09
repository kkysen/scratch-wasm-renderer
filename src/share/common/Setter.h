//
// Created by Khyber on 5/6/2019.
//

#pragma once

#include <memory>

template <typename T, class F>
class Setter {

private:
    
    F setter;
    
public:
    
    explicit constexpr Setter(F setter) noexcept : setter(setter) {}
    
    Setter& operator=(const T& t) noexcept(noexcept(setter(t))) {
        setter(t);
        return *this;
    }
    
};
