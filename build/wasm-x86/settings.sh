SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
    export FLAGS="-g3 -O0 -DDEBUG"
    export CMAKE_BUILD_TYPE="Debug"
    export MESON_BUILD_TYPE="debug"
else
    export FLAGS="-O3 -DNDEBUG"
    export CMAKE_BUILD_TYPE="Release"
    export MESON_BUILD_TYPE="release"
fi

# Shared options
export PLATFORM=WASM
export QUANTUMS=("Q8")
export EXTENSION="js"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="emconfigure ./configure"
export CONFIGURE_OPTIONS=""
export CMAKE_COMMAND="emcmake cmake"
export CMAKE_OPTIONS=""
export MAKE="emmake make"
export MAKEFLAGS="-j$(nproc)"
export MESON_OPTIONS="--cross-file=$SCRIPT_PATH/cross-compilation.meson"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=0"
export SSE_OPTIONS="--disable-sse"

# Library specific options
export FFI_OPTIONS="--disable-exec-static-tramp"
export FONTCONFIG_OPTIONS=""
export HEIF_OPTIONS="-DENABLE_MULTITHREADING_SUPPORT=false"
export LCMS_OPTIONS="--without-threads"
export OPENEXR_OPTIONS="-DZLIB_LIBRARY=/usr/local/lib/libz.a -DZLIB_INCLUDE_DIR=/usr/local/include -DImath_DIR=/usr/local/lib/cmake/Imath"
export WEBP_OPTIONS=""
export IMAGEMAGICK_OPTIONS="--disable-openmp --without-threads --with-webp=yes --with-autotrace=no --with-bzlib=no --with-djvu=no --with-dps=no --with-fftw=no --with-flif=no --with-fpx=no --with-fontconfig=no --with-freetype=no --with-gslib=no --with-gvc=no --with-jbig=no --with-jpeg=no --with-jxl=no --with-dmr=no --with-lcms=no --with-lqr=no --with-ltdl=no --with-lzma=no --with-magick-plus-plus=no --with-openexr=no --with-openjp2=no --with-pango=no --with-perl=no --with-png=no --with-raqm=no --with-raw=no --with-rsvg=no --with-tiff=no --with-uhdr=no --with-wmf=no --with-x=no --with-xml=no --with-zip=no --with-zlib=no --with-zstd=no"

# WASM options
export CC=emcc
export CXX=em++
export EM_PKG_CONFIG_PATH=$PKG_PATH
export LIBRARY_NAME="magick"
