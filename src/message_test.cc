#include <gtest/gtest.h>
#include "message.h"

TEST(MessageTest, CorrectMessage) {
    EXPECT_EQ(get_message(), std::string("Hello, world! This binary was built with Bazel."));
}