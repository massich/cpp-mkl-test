This is an extremely simple example C++ application which uses CMake to build a hello that links in different manners to BLAS.

### Installation ###
As this is an example of how to use CMake you'll need to download it (http://www.cmake.org/cmake/resources/software.html) or install it via:
```bash
sudo apt-get install cmake
```
Once CMake has been install navigate to the root of the project and issue the following commands:
```bash
mkdir build
cd build
cmake .. && make
```
You may need to use`sudo make install` command as it will install to /usr/local/bin .  This might be a good opportunity to investigate stow (http://www.gnu.org/software/stow/manual/stow.html) as a means of managing the installation of applications in this manner, however I haven't gotten far enough into my CMake knowledge to take that step.

