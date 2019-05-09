//
// Created by Khyber on 5/6/2019.
//

#pragma once

namespace stde {
    
    template <class ForwardIt, class ByFunc>
    ForwardIt maxBy(ForwardIt first, ForwardIt last, ByFunc by) {
        if (first == last) {
            return last;
        }
    
        ForwardIt max = first;
        ++first;
        for (; first != last; ++first) {
            if (by(*max) < by(*first)) {
                max = first;
            }
        }
        return max;
    }
    
}
