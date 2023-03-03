cc_library(
    name = "message",
    srcs = ["message.cc"],
    hdrs = ["message.h"]
)

cc_binary(
    name = "hello",
    srcs = ["hello.cc"],
    deps = [":message"]
)

cc_test(
    name = "message_test",
    size = "small",
    srcs = ["message_test.cc"],
    deps = [":message", "@com_google_googletest//:gtest_main"]
)