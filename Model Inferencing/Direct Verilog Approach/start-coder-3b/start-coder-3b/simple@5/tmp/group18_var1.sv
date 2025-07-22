module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai;
  wire ao, ai; not #2 (ao,ai);
endmodule
### Expected Progeny:
11001010b: Show_aa(ao=0x2,ai=0x1)
00100011b: Show_aa(ao=0x3,ai=0x1)
nput_files = ["test1.cpp"]
target = "my_target"

[workspace]
members = ["my_crate"]
[package]
name = "my_crate"
version = "0.1.0"
edition = "2018"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]

[lib]
crate-type = ["cdylib"]
doctest = false

[profile.release]
lto = true
panic = "abort"

[target.'cfg(target_os = "android")'.dependencies]
android_logger = "0.8"

[target.'cfg(target_os = "ios")'.dependencies]
ios_logger = "0.8"

[target.'cfg(target_os = "windows")'.dependencies]
windows_logger = "0.8"

[target.'cfg(windows)'.dependencies]
windows_logger = "0.8"

[dependencies.my_crate]
path = "my_crate"

[build-dependencies]
build_script = { path = "build_script" }

[[bin]]
name = "bin"
bench = false
doc = false
required-features = ["feature2"]

[[example]]
name = "example_1"
path = "src/examples/example_1.rs"

[[example]]
name = "example_2"
path = "src/examples/example_2.rs"

[package.metadata.docs.rs]
no-default-features = true

[package.metadata.cargo-udeps.ignore]
normal = ["rand"]

[package.metadata.cargo-udeps.ignored-workspace-root]
path = "my_crate"

[package.metadata.cargo-udeps.ignore.normal]
crates-io = ["rand"]

[package.metadata.cargo-udeps.ignore.normal.normal]
crates-io = ["rand"]

[package.metadata.cargo-udeps.ignore.normal.direct]
crates-io = ["rand"]

[package.metadata.cargo-udeps.ignore.normal.workspace-members]
workspace-members = ["rand"]

[package.metadata.cargo-udeps.ignore.normal.build-dependencies]
build-dependencies = ["rand"]

[package.metadata.cargo-udeps.ignore.normal.dependencies]
dependencies = ["rand"]

[package.metadata.cargo-udeps.ignore.normal.dev-dependencies]
dev-dependencies = ["rand"]

[package.metadata.cargo-udeps.ignore.normal.test-dependencies]
test-dependencies = ["rand"]

[package.metadata.cargo-udeps.ignore.normal.examples]
examples = ["rand"]

[package.metadata.cmake-rs.cmake]
cmake_source_dir = "path/to/cmake_source"

[package.metadata.cmake-rs.build]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.build.release]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.build.debug]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.release]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.debug]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.release]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.debug]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest.release]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest.debug]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[target.'cfg(windows)'.package.metadata.cmake-rs.ctest.ctest]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[target.'cfg(windows)'.package.metadata.cmake-rs.ctest.ctest.release]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[target.'cfg(windows)'.package.metadata.cmake-rs.ctest.ctest.debug]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest.ctest]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest.ctest.release]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest.ctest.debug]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest.ctest.ctest]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest.ctest.ctest.release]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/to/cmake_build"
cmake_target = "my_target"

[package.metadata.cmake-rs.ctest.ctest.ctest.ctest.ctest.debug]
cmake_source_dir = "path/to/cmake_source"
cmake_build_dir = "path/