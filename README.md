# cmake

> 2023.2.11

## 一、安装 cmake

- 绝大部分linux 环境装有 cmake
- 官网安装

## 二、例子 helloworld 

> Shiyan1 内部构建

1. 新建两个文件

   - main.c

   ``` c++
   #include <stido.h>
   int main()
   {
       printf("Hello World cmake!!!");
   		return 0; 
   }
   ```

   - CMakeLists.txt

   ```tex
   PROJECT (HELLO)
   SET(SRC_LIST main.c)
   MESSAGE(STATUS "This is BINARY dir "${HELLO_BINARY_DIR})
   MESSAGE(STATUS "This is SOURCE dir "${HELLO_SOURCE_DIR})
   ADD_EXECUTABLE(hello ${SRC_LIST})
   ```

2. cmake 生成 makefile 文件

```shell
# cmake 生成 makefile 文件
cmake .
```

3. make 生成可执行文件

```shell
make
```

## 三、CMakeLists.txt 中的配置

通过前面的cmake工程构建过程以及编译,大家已经完成了cmake的一个基本操作。但是一定会有很多 同学们对于CMakeLists.txt有很多疑问。现在我给大家解释一下CMakeLists.txt这个文件,这个文件是 cmake的构建定义文件,文件名是大小写相关的,大家一定要写成CMakeLists.txt这样,如果一个项目工程 存在多个目录,需要确保每个要管理的目录均存在一个CMakeLists.txt的文件(关于多目录构建,后续会进 行解读),下面分别对以上CMakeLists.txt文件中各个命令进行解析。 

- PROJECT:指令语法是`PROJECT(projectname [CXX][C][Java])`,你可以用这个指令定义工程名称以及指 定工程支持的语言。通常来说,支持的语言可以忽略,默认支持所有语言,而这个指令隐式的定义了两个 cmake变量:`projectname_BINARY_DIR`以及`projectname_SOURCE_DIR`,所以CMakeLists.txt指令中可以 直接使用这两个变量,由于本次采用的是内部编译,两个变量指向均为/test/cmake/test1,后续我们将讲解 到外部编译,两者所指代的内容会有所不同,并且cmake系统也会帮我们自定义了`PROJECT_BINARY_DIR` 和`PROJECT_SOURCE_DIR`变量,为了统一起⻅,大家还是使用系统自定义的即可,否则当工程名修改后, 对应的变量也会被修改。
-  SET:指令语法是:`SET(VAR[VALUE][CACHE TYPE DOCSTRING [FORCE]])`,现阶段只需要了解SET指令 是用来显式定义变量。比如我们用到的SET(SRC_LIST main.c),意味着main.c文件可以用SRC_LIST代 替,但是如果有多个文件,那么也可以定义成:`SET(SRC_LIST main.c 1.c 2.c)`。 
- MESSAGE:指令语法是`MESSAGE([SEND_ERROR | STATUS | FATAL_ERROR] "message to display")`, 这个指令主要是用于向终端输出一些用户自定义的信息,如上所示包含了3个三种类型:SEND_ERROR,产 生错误,生成过程被跳过。STATUS:输出前缀信息。FATAL_ERROR:立即终止所有cmake过程。本章节 使用了STATUS来表示自定义变量的输出,并且使用了$来进行定义变量。 
- `ADD_EXECUTABLE(hello $(SRC_LIST))`,定义了这个工程通过该编译会生成一个hello的可执行文件,而 其依赖的源文件为SRC_LIST中定义的源文件列表,当然也可以用ADD_EXECUTABLE(hello main.c)来进 行代替。

> 注意⚠ :工程名称HELLO与生成的可执行文件hello是没有任何关系的,hello只是一个被定义的可执行文件名。



## 四、内部构建和外部构建

> shiyan2 外部构建
>
> Shiyan3 外部构建 源代码独立存储

在编译过程中会生成一些中间文件，内部构建时生成的中间文件与源代码混杂在一起，污染了源代码。利用外部构建使得生成的中间文件都保存到固定文件内。

内部构建：HELLO_SOURCE_DIR（工程路径）和 HELLO_BINARY_DIR（编译路径）相同

外部构建：HELLO_SOURCE_DIR（工程路径）和 HELLO_BINARY_DIR（编译路径）不同

```shell
# 文件树
├── CMakeLists.txt      # 说明还有其他文件（src）需要编译
├── build
└── src									# 源代码
    ├── CMakeLists.txt  
    └── main.cpp

# 外部构建
-- This is BINARY dir .../shiyan3/build/bin
-- This is SOURCE dir .../shiyan3/src
```

- 每个文件下都有 CMakeLists.txt 文件

```cmake
# 外部 CMkeLists.txt
PROJECT(HELLO)
ADD_SUBDIRECTORY(src bin)
```

```cmake
# src 中 CMakeLists.txt
PROJECT (HELLO)
SET(SRC_LIST main.cpp)
MESSAGE(STATUS "This is BINARY dir "${HELLO_BINARY_DIR})
MESSAGE(STATUS "This is SOURCE dir "${HELLO_SOURCE_DIR})
ADD_EXECUTABLE(hello ${SRC_LIST})
```

- 编译

```shell
cd build
cmake ..
make
# 生成bin文件下有可执行文件
```



## 五、安装

> shiyan4 安装

打包头文件和库文件

- INSTALL 指令：将文件存储到linux对应的目录下，使得任意路径下都能运行安装的程序。
  - 将程序路径加到系统变量PATH
  - 将依赖库文件路径加到 LD_LIBRARY_PATH
- DESTINATION定义了安装的路径,如果路径以/开头,那么是指绝对路径,这时候 CMAKE_INSTALL_PREFIX其实就无效了,如果使用CMAKE_INSTALL_PREFIX定义安装路径,就要写 成相对路径,不要以/开头,那么安装后的路径就是${CMAKE_INSTALL_PREFIX}/<DESTINATION定 义的路径>

1. 安装文件

```cmake
### 普通文件的安装 
INSTALL(FILES files...) 
[DESTINATION] <dir>] 
[PERMISSIONS permissions...] 
[CONFIGURATIONS [Debug|Release|...]] 
[COMPONENT <component>] 
[RENAME <name>] [OPTIONAL] )

# 将 COPYRIGHT README 两文件安装到 share/doc/cmake 路径下
INSTALL(FILES COPYRIGHT README DESTINATION share/doc/cmake)
```

可用于安装一般文件,并可以指定访问权限,文件名是此指令所在路径下的相对路径,如果默认不定义权 限PERMISSIONS,安装后的权限为:OWNER_WRITE,OWNER_READ,GROUP_READ和WORLD_READ,即 644权限。

2. 安装脚本

```cmake
### 非目标文件的可执行程序安装
INSTALL(PROGRAMS files...) 
[DESTINATION] <dir>] 
[PERMISSIONS permissions...] 
[CONFIGURATIONS [Debug|Release|...]] 
[COMPONENT <component>] 
[RENAME <name>] 
[OPTIONAL] ) 

# 安装脚本到 usr/bin 下
INSTALL(PROGRAMS runhello.sh DESTINATION bin)
```

与上面的FILES指令使用基本一样,唯一的不同是安装后权限为: OWNER_EXECUTE,GROUP_EXECUTE以及WORLD_EXECUTE,即755权限

3. 安装目录

```cmake
### 目录的安装 
INSTALL(DIRECTORY dirs...) 
[DESTINATION] <dir>] 
[FILE_PERMISSIONS permissions...] 
[DIRECTORY_PERMISSIONS permissions...] 
[USE_SOURCE_PERMISSIONS] 
[CONFIGURATIONS [Debug|Release|...]] 
[COMPONENT <component>] 
[[PATTERN <pattern> | REGEX <regex>] 
[EXCLUDE][PERMISSIONS permissions...]] [...])

# 
INSTALL(DIRECTORY doc/ DESTINATION share/doc/cmake)
```

DIRECTORY后面连接的是所在 Source目录的相对路径,但务必注意:abc与abc/有很大的区别。如果目录名不以/结尾,那么这个目录将被安装 为目标路径下的abc,如果目录名以/结尾,代表将这个目录中的内容安装到目标路径,但是不包括这个目录本 身。

- 编译后安装

```shell
cd build
cmake ..
make 
sudo make install
```



## 六、静态库动态库构建

> Shiyan5 静态库
>
> Shiyan6 静态库+动态库+安装

静态库和动态库的区别

- 静态库扩展名一般为 “.a” 或 “.lib”; 动态库扩展名一般为 “.so” 或 “.dll”。
- 静态库在编译时会被整合到目标程序中，编译成功的可执行文件可独立运行。
- 动态库在编译时不会被整合到目标程序中，编译成功的可执行文件无法单独运行。

1. 建立一个动态库以及静态库,提供HelloFunc函数供给其他程序编程使用,HelloFunc向终端输出Hello World的字符串

```c++
// 文件树
├── CMakeLists.txt
├── build
└── lib
    ├── CMakeLists.txt
    ├── hello.cpp
    └── hello.h


// 库文件
// hello.cpp
#include "hello.h"
#include <iostream>
using namespace std;
void HelloFunc()
{
	cout<<"hello world cmake!!!!"<<endl;
}

// hello.h
#ifndef HELLO_H
#define HELLO_H
void HelloFunc(void);
#endif
```

​	

```cmake
# 外部 CMakeLists
PROJECT(HELLO_FUNC)
ADD_SUBDIRECTORY(lib bin)

# lib CMakeLists
SET(HELLO_LIB_SRC hello.cpp)
ADD_LIBRARY(hello SHARED ${HELLO_LIB_SRC})
```

> 内部不需要写libhello, 只需要写hello即可, 由于cmake系统会自动为你生成libhello.X的.
>
> 写的是hello，生成的是 libhello.X

指令讲解:ADD_LIBRARY

```cmake
ADD_LIBRARY(libname 
[SHARED|STATIC|MODULE] 
[EXCLUDE_FROM_ALL] source1 source2 ...sourceN) 
```

库类型主要有三种:

- SHARED 动态库;
- STATIC 静态库;
- MODULE 在使用dyld的系统有效,如果不支持dyld,则被当作SHARED对待;

EXCLUDE_FROM_ALL 参数的意思是说这个库不会被默认构建,除非有其他的组件依赖或者手工构建,**EXCLUDE经常用于测试版本**,而在进行release时候,这些测试代码不需要添加进入,因此采用 EXCLUDE_FROM_ALL来阻止其编译,只能通过手动完成编译。



2. 同时构建静态库和动态库

```cmake
# lib CMakeLists
SET(HELLO_LIB_SRC hello.cpp)
ADD_LIBRARY(hello SHARED ${HELLO_LIB_SRC})
ADD_LIBRARY(hello STATIC ${HELLO_LIB_SRC})   => 报错

SET(HELLO_LIB_SRC hello.cpp)
ADD_LIBRARY(hello SHARED ${HELLO_LIB_SRC})
ADD_LIBRARY(hello_static STATIC ${HELLO_LIB_SRC})   => 成功 => 库名字不相同
```

同时构建静态库和动态库，且库名只是后缀不同需要用到一个新的指令

```cmake
SET(LIBHELLO_SRC hello.cpp)
# 动态库
ADD_LIBRARY(hello SHARED ${LIBHELLO_SRC})
# 输出名字重命名
SET_TARGET_PROPERTIES(hello PROPERTIES OUTPUT_NAME "hello")
# 清除
SET_TARGET_PROPERTIES(hello PROPERTIES CLEAN_DIRECT_OUTPUT 1)

# 静态库
ADD_LIBRARY(hello_static STATIC ${LIBHELLO_SRC})
SET_TARGET_PROPERTIES(hello_static PROPERTIES OUTPUT_NAME "hello")
SET_TARGET_PROPERTIES(hello_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
```

版本号

```cmake
SET_TARGET_PROPERTIES(hello PROPERTIES VERSION 1.2 SOVERSION 1)
# :VERSION指动态库版本,SOVERSION指API版本。
```

3. 安装

安装二进制文件用关键字 TARGETS

```cmake
INSTALL(TARGETS hello hello_static LIBRARY DESTINATION lib ARCHIVE DESTINATION lib) 
INSTALL(FILES hello.h DESTINATION include/hello) 
## 注意静态库要使用ARCHIVE关键字,通过cmake -DCMAKE_INSTALL_PREFIX=/usr .. make make install
```



## 七、静态库、动态库、头文件使用

> Shiyan7 

```shell
# 文件树
.
├── CMakeLists.txt
├── build
└── src
    ├── CMakeLists.txt
    └── main.cpp
    
# 在 main.cpp 中使用 HelloFunc() 函数
```

在编译过程中未找到头文件，可在内层 CMakeLists.txt 中添加头文件搜索路径

```cmake
INCLUDE_DIRECTORIES(usr/include/hello)
```

在编译过程中未找到 cpp文件，可在内层 CMakeLists.txt 中添加

```cmake
# 方法1 非标准的共享库搜索路径
LINK_DIRECTORIES()
# 方法2 添加需要链接的共享库   动态链接库需要在环境变量下
TARGET_LINK_LIBRARIES(main libhello.dylib)  # 写在 ADD_EXCUTABLE 后面
```

> Mac m1 报错
>
> Undefined symbols for architecture arm64:
>   "HelloFunc()", referenced from:
>       _main in main.o
> ld: symbol(s) not found for architecture arm64
> clang: error: linker command failed with exit code 1 (use -v to see invocation)