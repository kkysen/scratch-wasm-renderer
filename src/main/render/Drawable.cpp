//
// Created by Khyber on 4/27/2019.
//

#include "Drawable.h"
#include <iostream>

int main() {
    std::cout << "Hello" << std::endl;
    using namespace scratch::render;
    using namespace shader::effects;
    Drawable drawable(0);
    std::cout << drawable.getEnabledEffects() << std::endl;
    drawable.updateDirection(5);
    drawable.updatePosition(Vec2(100, 200));
    drawable.updateScale(Vec2(90, 90));
    drawable.updateVisibility(true);
    std::array<Effect, 3> effects = {Effect(color, 10), Effect(fisheye, 20), Effect(ghost, 25)};
    drawable.updateEffects(effects);
    std::array<Vec2, 5> points = {Vec2(1, 2), Vec2(5, 4), Vec2(10, 24), Vec2(9, 3), Vec2(34, 43)};
    drawable.setConvexHullPoints(points);
    std::cout << drawable.getEnabledEffects() << std::endl;
    std::cout << drawable.getFastBounds().top << std::endl;
    return static_cast<int>(drawable.getBounds().corners().matrix[0][0][0]);
}