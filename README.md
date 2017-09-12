# 静态库合成  
    如果想把两个静态库A和B合成一个，有两种方式；
## 合成方式一  
    把静态库A写入到B的代码中，然后把新的代码打包成一个新的静态库；这个静态库，就包含了A和B的方法；  
    
## 合成方式二
    A和B已经是打包好的库，直接把二者合成；
    ① 首先由两个库文件libLibOne.a和libLibTwo.a；  
    ② 每一个库文件都包含了几个版本armv7、arm64、i386，首先要把每一个版本都分离开；  
      lipo -extract_family i386 -output libLibOne_i386.a libLibOne.a（分离i386版）
      lipo libLibOne.a -thin armv7 -output libLibOne_armv7.a（分离armv7版）
      lipo libLibOne.a -thin arm64 -output libLibOne_arm64.a（分离arm64版）
    ③ 然后把每一个版本下的两个库合成（以合成armv7为例）
      ar -x libLibOne_armv7.a（会生成LibOne.o文件）
      ar -x libLibTwo_armv7.a（会生成LibTwo.o文件）
      libtool -static -o libLib_armv7.a *.o（合并两个.o生成libLib_armv7.a文件）
    ④ 合并每个版本的库(包括libLib_armv7.a，libLib_arm64.a，libLib_i386.a)
      lipo -create libLib_armv7.a libLib_arm64.a libLib_i386.a -output libLib.a
    ⑤ libLib.a库中包含了A和B两个库的内容；
