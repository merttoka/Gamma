# - Try to find SNDFILE
# Once done this will define
#
#  SNDFILE_FOUND - system has SNDFILE
#  SNDFILE_INCLUDE_DIR - the SNDFILE include directory
#  SNDFILE_LIBRARIES - Link these to use SNDFILE
#

include(LibFindMacros)

# Dependencies
#libfind_package(LO Magick)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(SNDFILE_PKGCONF libsndfile)

# Include dir
find_path(SNDFILE_INCLUDE_DIR
  NAMES sndfile.h
  PATHS ${SNDFILE_PKGCONF_INCLUDE_DIRS}
      /usr/lib
      /usr/local/lib
      /opt/local/lib
      /sw/lib
      "${CMAKE_CURRENT_SOURCE_DIR}/external/include"
)

# Finally the library itself
find_library(SNDFILE_LIBRARY
  NAMES sndfile libsndfile libsndfile-1
  PATHS ${SNDFILE_PKGCONF_LIBRARY_DIRS}
      /usr/lib
      /usr/local/lib
      /opt/local/lib
      /sw/lib
      "${CMAKE_CURRENT_SOURCE_DIR}/external/lib_win32"
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(SNDFILE_PROCESS_INCLUDES SNDFILE_INCLUDE_DIR)
set(SNDFILE_PROCESS_LIBS SNDFILE_LIBRARY)
libfind_process(SNDFILE)
