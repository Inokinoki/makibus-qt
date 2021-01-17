cmake_minimum_required(VERSION 3.0)

set (MAKIBUS_VERSION_MAJOR "0")
set (MAKIBUS_VERSION_MINOR "0")
set (MAKIBUS_VERSION_MICRO "1")
set (MAKIBUS_VERSION "${MAKIBUS_VERSION_MAJOR}.${MAKIBUS_VERSION_MINOR}.${MAKIBUS_VERSION_MICRO}")

project(makibus-qt VERSION ${MAKIBUS_VERSION})

find_package(ECM ${KF5_MIN_VERSION} REQUIRED NO_MODULE)
# FIXME: find ibus-qt lib
find_library(LIBIBUSQT ibus-qt)
# message(${LIBIBUSQT})
# FIXME: find ibus-qt headers

set(makibus_SRCS
    main.mm
)

add_executable(makibus ${makibus_SRCS})

target_link_libraries(makibus ${LIBIBUSQT})

# Apple frameworks
target_link_libraries(makibus "-framework AppKit")
# Apple app package
set_target_properties(makibus PROPERTIES MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/Info.plist)
set_target_properties(makibus PROPERTIES
    MACOSX_BUNDLE_BUNDLE_NAME "Makibus"
    MACOSX_BUNDLE_LONG_VERSION_STRING "astronaut"
    MACOSX_BUNDLE_SHORT_VERSION_STRING "${MAKIBUS_VERSION_MAJOR}.${MAKIBUS_VERSION_MINOR}.${MAKIBUS_VERSION_PATCH}"
    MACOSX_BUNDLE_GUI_IDENTIFIER "cc.inoki.inputmethod.makibus")

install(TARGETS makibus ${INSTALL_TARGETS_DEFAULT_ARGS})
