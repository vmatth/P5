#include <pluginlib/class_list_macros.h>
#include <polygon_base.h>
#include <polygon_plugins.h>

PLUGINLIB_EXPORT_CLASS(polygon_plugins::Triangle, polygon_base::RegularPolygon)
PLUGINLIB_EXPORT_CLASS(polygon_plugins::Square, polygon_base::RegularPolygon)
