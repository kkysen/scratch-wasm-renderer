//
// Created by Khyber on 5/6/2019.
//

#pragma once

#include <src/share/common/numbers.h>
#include "Vec.h"

namespace math {
    
    template <size_t M, size_t N, typename T = f32>
    class Mat {
    
    public:
        
        using Row = Vec<N, T>;
        using Col = Vec<M, T>;
        using Matrix = Vec<M, Row>;
        using Vector = Vec<M * N, T>;
        using RawMatrix = std::array<std::array<T, N>, M>;
        using RawArray = std::array<T, M * N>;
        
        union {
            Matrix matrix;
            Vector vector;
            struct {
                RawMatrix matrix;
                RawArray array;
            } raw;
        };
        
        /*implicit*/ _constexpr Mat(const Matrix& matrix) noexcept : matrix(matrix) {};
        
        explicit _constexpr Mat(const RawMatrix& matrix) noexcept
                : raw({.matrix = matrix}) {}
        
        explicit _constexpr Mat(T(& matrix)[M][N]) noexcept
                : Mat(reinterpret_cast<const RawMatrix&>(matrix)) {}
    
    private:
        
        template <typename U>
        static _constexpr Mat<M, N, U> of(const Vec<M, Vec<N, U>>& matrix) noexcept {
            return Mat<M, N, U>(matrix);
        }
    
    public:
        
        _constexpr const Row& operator[](size_t i) const noexcept {
            return matrix[i];
        }
        
        _constexpr Row& operator[](size_t i) noexcept {
            return matrix[i];
        }
        
        _constexpr const Row& row(size_t i) const noexcept {
            return (*this)[i];
        }
        
        _constexpr Row& row(size_t i) noexcept {
            return (*this)[i];
        }
        
        _constexpr Col col(size_t j) const noexcept {
            return matrix.map([j](const Row& row) { return row[j]; });
        }
        
        _constexpr const T& operator()(size_t i, size_t j) const noexcept {
            return (*this)[i][j];
        }
        
        _constexpr T& operator()(size_t i, size_t j) noexcept {
            return (*this)[i][j];
        }
        
        template <class F>
        _constexpr auto map(F f) const noexcept {
            return of(matrix.map([f](const Row& row) { return row.map(f); }));
        }
        
        template <class F>
        _constexpr auto mapIndexed(F f) const noexcept {
            return of(matrix.mapIndexed([f](const Row& row, auto i) {
                return row.mapIndexed([f, i](const T& e, auto j) {
                    return f(e, i, j);
                });
            }));
        }
        
        template <class F>
        _constexpr void forEachIndexed(F f) const noexcept {
            matrix.forEachIndexed([f](const Row& row, auto i) {
                row.forEachIndexed([f, i](const T& e, auto j) {
                    f(e, i, j);
                });
            });
        }
        
        template <class F>
        static _constexpr auto mapIndex(F f) noexcept {
            return of(Col::mapIndex([f](auto i) {
                return Row::mapIndex([f, i](auto j) {
                    return f(i, j);
                });
            }));
        }
        
        template <typename R = T, class F>
        _constexpr R fold(F f) const noexcept {
            return matrix.map([f](const Row& row) { return row.fold(f); })
                    .fold(f);
        }
        
        template <size_t M2, size_t N2>
        _constexpr Mat<M2, N2, T> truncate() const noexcept {
            return matrix.template truncate<M2>().map([](const Row& row) { return row.template truncate<N2>(); });
        }
        
        template <size_t M2, size_t N2>
        _constexpr Mat& operator=(const Mat<M2, N2, T>& truncated) noexcept {
            static_assert(M2 <= M);
            static_assert(N2 <= N);
            const auto& self = *this;
            truncated.mapIndexed([self](const T& t, auto i, auto j) {
                self[i][j] = t;
            });
        }
        
        template <size_t M2>
        _constexpr Mat<M2, N, T> extendRows(const Row& defaultRow = Row::zero()) const noexcept {
            return Mat<M2, N, T>(matrix.template extend<M2>(defaultRow));
        }
        
        _constexpr Mat<N, M, T> transpose() const noexcept {
            const auto& m = *this;
            return Mat<N, M, T>::mapIndex([m](auto i, auto j) { return m[j][i]; });
        }
        
        static _constexpr Mat same(const T& t) noexcept {
            return mapIndex([t](auto, auto) { return t; });
        }
    
    private:
        
        static const Mat _zero;
        static const Mat _one;
        
        static _constexpr Mat makeZero() noexcept {
            return same(0);
        }
        
        static _constexpr Mat makeOne() noexcept {
            return mapIndex([](auto i, auto j) -> T { return i == j ? 1 : 0; });
        }
    
    public:
        
        static _constexpr const Mat& zero() noexcept {
            return _zero;
        }
        
        static _constexpr const Mat& one() noexcept {
            return _one;
        }
        
        static _constexpr const Mat& identity() noexcept {
            return one();
        }
        
    };
    
    template <size_t M, size_t N, typename T>
    const Mat<M, N, T> Mat<M, N, T>::_zero = makeZero();
    
    template <size_t M, size_t N, typename T>
    const Mat<M, N, T> Mat<M, N, T>::_one = makeOne();
    
    template <size_t M, size_t N, size_t P, size_t Q, typename T>
    _constexpr Vec<P, T> operator*(const Mat<M, N, T>& a, const Vec<Q, T>& x) noexcept {
        return Vec<P, T>::mapIndex([a, x](auto i) {
            return dot(a[i].template truncate<Q>(), x);
        });
    }
    
    template <size_t N, size_t P, typename T>
    _constexpr Vec<P, T> operator*(const Mat<N, N, T>& a, const Vec<P, T>& x) noexcept {
        return operator*<N, N, P, P, T>(a, x);
    }
    
    template <size_t M, size_t N, typename T>
    _constexpr typename Mat<M, N, T>::Col operator*(
            const Mat<M, N, T>& a, const typename Mat<M, N, T>::Row& x) noexcept {
        return operator*<M, N, M, N, T>(a, x);
    }

//    template <size_t M, size_t N, typename T, typename U>
//    _constexpr auto operator*(const Mat<M, N, T>& a, const Vec<N, U>& x) noexcept
//    -> Vec<M, decltype((a[0] * x)[0])> {
//
//    }
    
    template <size_t M, size_t N, size_t P, typename T, typename U>
    _constexpr auto operator*(const Mat<M, N, T>& a, const Mat<N, P, U>& b) noexcept {
        using R = decltype(dot(a.row(0), b.col(0)));
        return Mat<M, P, R>::mapIndex([a, b](auto i, auto j) {
            return dot(a.row(i), b.col(j));
        });
    }

//    template <size_t N, size_t P, typename T, typename U>
//    _constexpr auto operator*(const Mat<N, N, T>& a, const Mat<P, P, U>& b) noexcept {
//        using R = decltype((a[0][0] * b[0][0]) + (a[0][0] * b[0][0]));
//        return Mat<P, P, R>::mapIndex([a, b](auto i, auto j) {
//            return dot(a.row(i).template truncate<P>(), b.col(j));
//        });
//    }
    
    template <size_t N, size_t P, typename T, typename U>
    _constexpr auto operator*(const Mat<N, N, T>& a, const Vec<P, T>& x) noexcept
    -> Vec<P, decltype((a[0] * x)[0])> {
        
    }
    
}
