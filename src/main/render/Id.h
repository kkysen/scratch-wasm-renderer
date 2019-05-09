//
// Created by Khyber on 5/1/2019.
//

#pragma once

#include "src/share/common/numbers.h"

namespace render {
    
    class Id {

    private:
        
        using T = u32;
        
        T id;
        
    public:
        
        constexpr Id(T id) noexcept : id(id) {}
        
        constexpr operator T() const noexcept {
            return id;
        }
    
        // must be function b/c Id is an incomplete type
        // so it's not a literal type yet, so I can't have a constexpr field of it
        static constexpr Id none() noexcept {
            return -1;
        }
        
        constexpr Id& operator++() noexcept {
            ++id;
            return *this;
        }

        constexpr const Id operator++(int) noexcept {
            const Id prev = id++;
            return prev;
        }
        
        constexpr Id& operator+=(Id _id) noexcept {
            id += _id;
            return *this;
        }
    
        constexpr Id& operator-=(Id _id) noexcept {
            id -= _id;
            return *this;
        }
        
    };
    
}
