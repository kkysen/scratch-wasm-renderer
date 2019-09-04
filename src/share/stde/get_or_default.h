//
// Created by Khyber on 5/15/2019.
//

#pragma once

namespace stde {
    
    template <template <class, class, class...> class C, typename K, typename V, typename... Args>
    const V& get_or_default(const C<K, V, Args...>& map, const K& key, const V& _default) {
        const auto it = map.find(key);
        return it == map.end() ? _default : it->second;
    }
    
    template <template <class, class, class...> class C, typename K, typename V, typename... Args>
    V& get_or_default(C<K, V, Args...>& map, const K& key, V& _default) {
        const auto it = map.find(key);
        return it == map.end() ? _default : it->second;
    }
    
}
