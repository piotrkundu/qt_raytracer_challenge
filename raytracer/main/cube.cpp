#include "cube.h"
#include "intersection.h"
#include "vector.h"

Vector Cube::local_normal_at(const Point& local_point) const {
    return local_point - Point(0, 0, 0);
}

std::vector<Intersection> Cube::local_intersect(const Ray& ray) const {

    const Vector sphere_to_ray = ray.origin() - Point(0, 0, 0);
    const float a = ray.direction().dot(ray.direction());
    const float b = 2 * ray.direction().dot(sphere_to_ray);
    const float c = sphere_to_ray.dot(sphere_to_ray) - 1.0f;

    const float discriminant = (b * b) - (4.0f * a * c);

    // No hit
    if (discriminant < 0) return {};

    // Hit, either two intersections (discriminant == 0)
    // or one on the tanget
    const float t1 = (-b - std::sqrt(discriminant)) / ( 2.0f * a);
    const float t2 = (-b + std::sqrt(discriminant)) / ( 2.0f * a);

    return {Intersection(t1, this), Intersection(t2, this)};
}
