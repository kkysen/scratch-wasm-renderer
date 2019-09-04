//
// Created by Khyber on 5/17/2019.
//

#pragma once

#include "Vec.h"

namespace math {
    
    template <typename T>
    struct Interval {
        
        T min;
        T max;
        
        _constexpr void orient() noexcept {
            const T tmp = min;
            min = math::min(min, max);
            max = math::max(tmp, max);
        }
        
        _constexpr Interval oriented() noexcept {
            return Interval {
                    .min = math::min(min, max),
                    .max = math::max(min, max),
            };
        }
        
    };
    
    namespace interval {
    
        template <typename T>
        using Interval = Vec<2, T>;
        
        template <typename T>
        _constexpr void orient(Interval<T>& interval) noexcept {
            auto& I = interval;
            const T tmp = I[0];
            I[0] = min(I[0], I[1]);
            I[1] = max(tmp, I[1]);
        }
    
        template <typename T>
        _constexpr Interval<T> oriented(const Interval<T>& interval) noexcept {
            const auto& I = interval;
            return Interval(min(I[0], I[1]), max(I[0], I[1]));
        }
        
        template <typename T>
        using Contains = bool (*)(const Interval<T>& interval, const T& value) noexcept;
        
        #define _contains(cmp1, cmp2) \
        template <typename T> \
        _constexpr bool contains(const Interval<T>& interval, const T& value) noexcept { \
            return interval[0] cmp1 value && value cmp2 interval[1]; \
        }
        
        namespace open {
            
            _contains(<, <)
            
        }
        
        namespace closed {
            
            _contains(<=, <=)
            
        }
        
        namespace openClosed {
            
            _contains(<, <=)
            
        }
        
        namespace closedOpen {
            
            _contains(<=, <)
            
        }
        
        #undef _contains
        
        using openClosed::contains;
        
    }
    
}
